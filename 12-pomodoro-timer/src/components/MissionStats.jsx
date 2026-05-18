import React from 'react';

export default function MissionStats({ completedSessions }) {
  const dotIndex = completedSessions % 4;

  return (
    <div className="bg-slate-900/40 border border-slate-800 rounded-xl p-4 flex items-center justify-between">
      <div className="text-left">
        <span className="text-xs text-slate-400 uppercase tracking-wider block">Progress</span>
        <span className="text-sm font-semibold text-white">
          Completed: <strong className="text-orange-500 font-mono text-base">{completedSessions}</strong>
        </span>
      </div>
      <div className="flex gap-1.5">
        {[...Array(4)].map((_, i) => (
          <span
            key={i}
            className={`w-3 h-3 rounded-full border transition-all duration-300 ${
              i < dotIndex ? 'bg-orange-500 border-orange-400 shadow-sm shadow-orange-500/50' : 'bg-slate-800 border-slate-700'
            }`}
          />
        ))}
      </div>
    </div>
  );
}