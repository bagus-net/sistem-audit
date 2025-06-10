<?php

namespace App\Http\Controllers;

use App\Models\Klausul;
use App\Models\Domain;
use Illuminate\Http\Request;

class KlausulController extends Controller
{
    public function index()
    {
        $klausuls = Klausul::with('domain')->get();
        return view('klausul.index', compact('klausuls'));
    }

    public function create()
    {
        $domains = Domain::all();
        return view('klausul.create', compact('domains'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'domain_id' => 'required|exists:domains,id',
            'kode_klausul' => 'required|max:10|unique:klausuls,kode_klausul',
            'nama_klausul' => 'required|max:255',
            'deskripsi' => 'nullable',
        ]);

        Klausul::create($request->all());

        return redirect()->route('klausul.index')
                         ->with('success', 'Klausul berhasil ditambahkan');
    }

    public function show($id)
    {
        $klausul = Klausul::with('domain')->findOrFail($id);
        return view('klausul.show', compact('klausul'));
    }

    public function edit($id)
    {
        $klausul = Klausul::findOrFail($id);
        $domains = Domain::all();
        return view('klausul.edit', compact('klausul', 'domains'));
    }

    public function update(Request $request, $id)
    {
        $klausul = Klausul::findOrFail($id);

        $request->validate([
            'domain_id' => 'required|exists:domains,id',
            'nama_klausul' => 'required|max:255',
            'deskripsi' => 'nullable',
        ]);

        $klausul->update($request->all());

        return redirect()->route('klausul.index')
                         ->with('success', 'Klausul berhasil diperbarui');
    }

    public function destroy($id)
    {
        $klausul = Klausul::findOrFail($id);
        $klausul->delete();

        return redirect()->route('klausul.index')
                         ->with('success', 'Klausul berhasil dihapus');
    }
}
