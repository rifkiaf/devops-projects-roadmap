import React, { useState, useEffect, useRef } from 'react';
import TimerDisplay from './components/TimerDisplay';
import Controls from './components/Controls';
import Settings from './components/Settings';
import MissionStats from './components/MissionStats';

export default function App() {
  const [workMin, setWorkMin] = useState(25);
  const [shortMin, setShortMin] = useState(5);
  const [longMin, setLongMin] = useState(15);

  const [sessionType, setSessionType] = useState('WORK'); 
  const [timeLeft, setTimeLeft] = useState(25 * 60);
  const [isActive, setIsActive] = useState(false);
  const [completedSessions, setCompletedSessions] = useState(0);

  const audioRef = useRef(null);

  const triggerAlarmSound = () => {
    try {
      if (!audioRef.current) {
        audioRef.current = new (window.AudioContext || window.webkitAudioContext)();
      }
      const ctx = audioRef.current;
      const osc = ctx.createOscillator();
      const gain = ctx.createGain();
      osc.type = 'sine';
      osc.frequency.setValueAtTime(880, ctx.currentTime); 
      gain.gain.setValueAtTime(0.3, ctx.currentTime);
      gain.gain.exponentialRampToValueAtTime(0.01, ctx.currentTime + 0.8);
      osc.connect(gain);
      gain.connect(ctx.destination);
      osc.start();
      osc.stop(ctx.currentTime + 0.8);
    } catch (e) {
      console.log("Audio blocked", e);
    }
  };

  useEffect(() => {
    let interval = null;
    if (isActive && timeLeft > 0) {
      interval = setInterval(() => {
        setTimeLeft((prev) => prev - 1);
      }, 1000);
    } else if (timeLeft === 0) {
      setIsActive(false);
      triggerAlarmSound();
      handleSessionSwitch();
    }
    return () => clearInterval(interval);
  }, [isActive, timeLeft]);

  useEffect(() => {
    const minutes = Math.floor(timeLeft / 60).toString().padStart(2, '0');
    const seconds = (timeLeft % 60).toString().padStart(2, '0');
    document.title = `(${minutes}:${seconds}) ${sessionType} | Pomodoro`;
  }, [timeLeft, sessionType]);

  const handleSessionSwitch = () => {
    if (sessionType === 'WORK') {
      const nextCount = completedSessions + 1;
      setCompletedSessions(nextCount);
      if (nextCount % 4 === 0) {
        setSessionType('LONG_BREAK');
        setTimeLeft(longMin * 60);
      } else {
        setSessionType('SHORT_BREAK');
        setTimeLeft(shortMin * 60);
      }
    } else {
      setSessionType('WORK');
      setTimeLeft(workMin * 60);
    }
  };

  const handleStartPause = () => setIsActive(!isActive);

  const handleReset = () => {
    setIsActive(false);
    setSessionType('WORK');
    setTimeLeft(workMin * 60);
  };

  const handleSettingUpdate = (type, minutes) => {
    if (type === 'WORK') {
      setWorkMin(minutes);
      if (sessionType === 'WORK') setTimeLeft(minutes * 60);
    } else if (type === 'SHORT_BREAK') {
      setShortMin(minutes);
      if (sessionType === 'SHORT_BREAK') setTimeLeft(minutes * 60);
    } else if (type === 'LONG_BREAK') {
      setLongMin(minutes);
      if (sessionType === 'LONG_BREAK') setTimeLeft(minutes * 60);
    }
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-slate-950 text-slate-100 p-4">
      <main className="max-w-md w-full p-6 bg-slate-800/90 rounded-2xl shadow-2xl border border-slate-700/80 text-center backdrop-blur-sm">
        <h1 className="text-3xl font-black tracking-wider text-transparent bg-clip-text bg-gradient-to-r from-orange-400 to-amber-500 mb-2">🍅 POMODORO</h1>
        <TimerDisplay timeLeft={timeLeft} sessionType={sessionType} />
        <Controls isActive={isActive} onStartPause={handleStartPause} onReset={handleReset} />
        <Settings workMin={workMin} shortMin={shortMin} longMin={longMin} onUpdate={handleSettingUpdate} disabled={isActive} />
        <MissionStats completedSessions={completedSessions} />
      </main>
    </div>
  );
}