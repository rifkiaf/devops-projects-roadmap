import React from 'react';

export default function Settings({ workMin, shortMin, longMin, onUpdate, disabled }) {
  return (
    <div className="bg-slate-900/60 p-4 rounded-xl border border-slate-700/50 my-6 text-left">
      <h3 className="text-sm font-bold text-slate-400 uppercase tracking-wider mb-3">Settings (Minutes)</h3>
      <div className="grid grid-cols-3 gap-3">
        <div>
          <label className="text-xs text-slate-400 block mb-1">Work</label>
          <input
            type="number"
            disabled={disabled}
            value={workMin}
            onChange={(e) => onUpdate('WORK', Math.max(1, parseInt(e.target.value) || 0))}
            className="w-full bg-slate-800 border border-slate-700 rounded-lg p-2 text-center text-orange-400 font-mono disabled:opacity-50 focus:outline-none"
          />
        </div>
        <div>
          <label className="text-xs text-slate-400 block mb-1">Short</label>
          <input
            type="number"
            disabled={disabled}
            value={shortMin}
            onChange={(e) => onUpdate('SHORT_BREAK', Math.max(1, parseInt(e.target.value) || 0))}
            className="w-full bg-slate-800 border border-slate-700 rounded-lg p-2 text-center text-emerald-400 font-mono disabled:opacity-50 focus:outline-none"
          />
        </div>
        <div>
          <label className="text-xs text-slate-400 block mb-1">Long</label>
          <input
            type="number"
            disabled={disabled}
            value={longMin}
            onChange={(e) => onUpdate('LONG_BREAK', Math.max(1, parseInt(e.target.value) || 0))}
            className="w-full bg-slate-800 border border-slate-700 rounded-lg p-2 text-center text-cyan-400 font-mono disabled:opacity-50 focus:outline-none"
          />
        </div>
      </div>
    </div>
  );
}