import React from 'react';

export default function Controls({ isActive, onStartPause, onReset }) {
  return (
    <div className="flex items-center justify-center gap-4 my-6">
      <button
        onClick={onStartPause}
        className={`flex-1 py-3 px-6 rounded-xl font-bold tracking-wide text-lg transition-all ${
          isActive ? 'bg-amber-500 hover:bg-amber-600 text-slate-950' : 'bg-emerald-500 hover:bg-emerald-600 text-slate-950'
        }`}
      >
        {isActive ? '⏸️ Pause' : '▶️ Start'}
      </button>
      <button
        onClick={onReset}
        className="py-3 px-6 rounded-xl font-bold bg-slate-700 hover:bg-slate-600 text-white border border-slate-600 transition-all"
      >
        🔄 Reset
      </button>
    </div>
  );
}