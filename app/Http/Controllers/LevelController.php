<?php

namespace App\Http\Controllers;

use App\Models\Level;
use App\Models\Klausul;
use Illuminate\Http\Request;

class LevelController extends Controller
{
    public function index()
    {
        $levels = Level::with('klausul')->get();
        return view('level.index', compact('levels'));
    }

    public function create()
    {
        $klausuls = Klausul::all();
        return view('level.create', compact('klausuls'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'klausul_id' => 'required|exists:klausuls,id',
            'level' => 'required|integer|min:2|max:5',
            'sub_proses' => 'nullable|string',
        ]);
        Level::create($validated);
        return redirect()->route('level.index')->with('success', 'Level berhasil ditambahkan');
    }

    public function edit($id)
    {
        $level = Level::findOrFail($id);
        $klausuls = Klausul::all();
        return view('level.edit', compact('level', 'klausuls'));
    }

    public function update(Request $request, $id)
    {
        $level = Level::findOrFail($id);
        $validated = $request->validate([
            'klausul_id' => 'required|exists:klausuls,id',
            'level' => 'required|integer|min:2|max:5',
            'sub_proses' => 'nullable|string',
        ]);
        $level->update($validated);
        return redirect()->route('level.index')->with('success', 'Level berhasil diupdate');
    }

    public function destroy($id)
    {
        $level = Level::findOrFail($id);
        $level->delete();
        return redirect()->route('level.index')->with('success', 'Level berhasil dihapus');
    }
}
