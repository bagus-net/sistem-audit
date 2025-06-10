<?php

namespace App\Http\Controllers;

use App\Models\ProsesTi;
use App\Models\Klausul;
use Illuminate\Http\Request;

class ProsesTiController extends Controller
{
    public function index()
    {
        $prosesTis = ProsesTi::with('klausul')->get();
        return view('proses_ti.index', compact('prosesTis'));
    }

    public function create()
    {
        $klausuls = Klausul::all();
        return view('proses_ti.create', compact('klausuls'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'klausul_id' => 'required|exists:klausuls,id',
            'kode_proses' => 'required|max:10|unique:proses_tis,kode_proses',
            'level' => 'required|integer',
            'praktik_manajemen' => 'required|max:255',
            'pertanyaan' => 'required',
        ]);

        ProsesTi::create($request->all());

        return redirect()->route('proses_ti.index')
                         ->with('success', 'Pertanyaan berhasil ditambahkan');
    }

    public function show($id)
    {
        $prosesTi = ProsesTi::with('klausul')->findOrFail($id);
        return view('proses_ti.show', compact('prosesTi'));
    }

    public function edit($id)
    {
        $prosesTi = ProsesTi::findOrFail($id);
        $klausuls = Klausul::all();
        return view('proses_ti.edit', compact('prosesTi', 'klausuls'));
    }

    public function update(Request $request, $id)
    {
        $prosesTi = ProsesTi::findOrFail($id);

        $request->validate([
            'klausul_id' => 'required|exists:klausuls,id',
            'kode_proses' => 'required|max:10|unique:proses_tis,kode_proses,' . $prosesTi->id,
            'level' => 'required|integer',
            'praktik_manajemen' => 'required|max:255',
            'pertanyaan' => 'required',
        ]);

        $prosesTi->update($request->all());

        return redirect()->route('proses_ti.index')
                         ->with('success', 'Pertanyaan berhasil diperbarui');
    }

    public function destroy($id)
    {
        $prosesTi = ProsesTi::findOrFail($id);
        $prosesTi->delete();

        return redirect()->route('proses_ti.index')
                         ->with('success', 'Pertanyaan berhasil dihapus');
    }
}
