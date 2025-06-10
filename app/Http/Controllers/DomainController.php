<?php

namespace App\Http\Controllers;
use App\Models\Domain;

use Illuminate\Http\Request;

class DomainController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $domains = Domain::all();
        return view('domain.index', compact('domains'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
       return view('domain.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'kode_domain' => 'required|unique:domains|max:5',
            'nama_domain' => 'required|max:255',
            'deskripsi' => 'nullable'
        ]);

        Domain::create($request->all());

        return redirect()->route('domain.index')
                         ->with('success', 'Domain berhasil ditambahkan');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $domain = Domain::findOrFail($id);
        return view('domain.show', compact('domain'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $domain = Domain::findOrFail($id);
        return view('domain.edit', compact('domain'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $domain = Domain::findOrFail($id);

        $request->validate([
            'kode_domain' => 'required|max:5|unique:domains,kode_domain,' . $domain->id,
            'nama_domain' => 'required|max:255',
            'deskripsi' => 'nullable'
        ]);

        $domain->update($request->all());

        return redirect()->route('domain.index')
                         ->with('success', 'Domain berhasil diperbarui');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $domain = Domain::findOrFail($id);

        if($domain->klausuls()->count() > 0) {
            return redirect()->back()
                             ->with('error', 'Tidak dapat menghapus domain yang memiliki klausul');
        }

        $domain->delete();
        return redirect()->route('domain.index')
                         ->with('success', 'Domain berhasil dihapus');
    }
}
