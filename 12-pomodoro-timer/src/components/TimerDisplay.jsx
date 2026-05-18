import React from 'react';

export default function TimerDisplay({ timeLeft, sessionType }) {
  const minutes = Math.floor(timeLeft / 60).toString().padStart(2, '0');
  const seconds = (timeLeft % 60).toString().padStart(2, '0');

  const getSessionLabel = () => {
    if (sessionType === 'WORK') return '💪 Work Session';
    if (sessionType === 'SHORT_BREAK') return '☕ Short Break';
    return '🌴 Long Break';
  };

  const getColorClass = () => {
    if (sessionType === 'WORK') return 'text-orange-500';
    if (sessionType === 'SHORT_BREAK') return 'text-emerald-400';
    return 'text-cyan-400';
  };

  return (
    <div className="text-center my-6">
      <span className="text-sm font-semibold uppercase tracking-widest text-slate-400 block mb-2">
        Current Session
      </span>
      <h2 className={`text-2xl font-bold mb-4 ${getColorClass()}`}>
        {getSessionLabel()}
      </h2>
      <div className="text-7xl font-mono font-bold tracking-tight bg-slate-900/50 py-6 rounded-2xl border border-slate-700/50 shadow-inner">
        {minutes}:{seconds}
      </div>
    </div>
  );
}