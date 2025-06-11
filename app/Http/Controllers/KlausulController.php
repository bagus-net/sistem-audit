<?php

namespace App\Http\Controllers;

use App\Models\Klausul;
use Illuminate\Http\Request;

/**
 * Controller for managing Klausul (Clause) operations.
 */
class KlausulController extends Controller
{
    /**
     * Display a listing of all klausuls.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Retrieve all klausul records from the database
        $klausuls = Klausul::all();
        // Return the klausul index view with the list of klausuls
        return view('klausul.index', compact('klausuls'));
    }

    /**
     * Show the form for creating a new klausul.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // Return the view to create a new klausul
        return view('klausul.create');
    }

    /**
     * Store a newly created klausul in the database.
     *
     * @param  \Illuminate\Http\Request  $request Incoming request with klausul data
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Validate the incoming request data
        $request->validate([
            'kode_klausul' => 'required|max:10|unique:klausuls,kode_klausul',
            'nama_klausul' => 'required|max:255',
            'deskripsi' => 'nullable',
        ]);

        // Create a new klausul record with the validated data
        Klausul::create($request->all());

        // Redirect to the klausul index page with a success message
        return redirect()->route('klausul.index')
                         ->with('success', 'Klausul berhasil ditambahkan');
    }

    /**
     * Display the specified klausul details.
     *
     * @param  int  $id The ID of the klausul to display
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // Find the klausul by ID or fail with 404 error
        $klausul = Klausul::findOrFail($id);
        // Return the klausul show view with the klausul data
        return view('klausul.show', compact('klausul'));
    }

    /**
     * Show the form for editing the specified klausul.
     *
     * @param  int  $id The ID of the klausul to edit
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // Find the klausul by ID or fail with 404 error
        $klausul = Klausul::findOrFail($id);
        // Return the klausul edit view with the klausul data
        return view('klausul.edit', compact('klausul'));
    }

    /**
     * Update the specified klausul in the database.
     *
     * @param  \Illuminate\Http\Request  $request Incoming request with updated data
     * @param  int  $id The ID of the klausul to update
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // Find the klausul by ID or fail with 404 error
        $klausul = Klausul::findOrFail($id);

        // Validate the incoming request data
        $request->validate([
            'kode_klausul' => 'required|max:10|unique:klausuls,kode_klausul',
            'nama_klausul' => 'required|max:255',
            'deskripsi' => 'nullable',
        ]);

        // Update the klausul record with the validated data
        $klausul->update($request->all());

        // Redirect to the klausul index page with a success message
        return redirect()->route('klausul.index')
                         ->with('success', 'Klausul berhasil diperbarui');
    }

    /**
     * Remove the specified klausul from the database.
     *
     * @param  int  $id The ID of the klausul to delete
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Find the klausul by ID or fail with 404 error
        $klausul = Klausul::findOrFail($id);
        // Delete the klausul record
        $klausul->delete();

        // Redirect to the klausul index page with a success message
        return redirect()->route('klausul.index')
                         ->with('success', 'Klausul berhasil dihapus');
    }

}
