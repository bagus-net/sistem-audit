<?php

namespace App\Http\Controllers;
use App\Models\Domain;

use Illuminate\Http\Request;

class DomainController extends Controller
{
    /**
     * Display a listing of all domains.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Retrieve all domain records from the database
        $domains = Domain::all();
        // Return the domain index view with the list of domains
        return view('domain.index', compact('domains'));
    }

    /**
     * Show the form for creating a new domain.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // Return the view to create a new domain
       return view('domain.create');
    }

    /**
     * Store a newly created domain in the database.
     *
     * @param  \Illuminate\Http\Request  $request Incoming request with domain data
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Validate the incoming request data
        $request->validate([
            'kode_domain' => 'required|unique:domains|max:5',
            'nama_domain' => 'required|max:255',
            'deskripsi' => 'nullable'
        ]);

        // Create a new domain record with the validated data
        Domain::create($request->all());

        // Redirect to the domain index page with a success message
        return redirect()->route('domain.index')
                         ->with('success', 'Domain berhasil ditambahkan');
    }

    /**
     * Display the specified domain details.
     *
     * @param  int  $id The ID of the domain to display
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // Find the domain by ID or fail with 404 error
        $domain = Domain::findOrFail($id);
        // Return the domain show view with the domain data
        return view('domain.show', compact('domain'));
    }

    /**
     * Show the form for editing the specified domain.
     *
     * @param  int  $id The ID of the domain to edit
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // Find the domain by ID or fail with 404 error
        $domain = Domain::findOrFail($id);
        // Return the domain edit view with the domain data
        return view('domain.edit', compact('domain'));
    }

    /**
     * Update the specified domain in the database.
     *
     * @param  \Illuminate\Http\Request  $request Incoming request with updated data
     * @param  int  $id The ID of the domain to update
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // Find the domain by ID or fail with 404 error
        $domain = Domain::findOrFail($id);

        // Validate the incoming request data, ignoring the current domain's kode_domain for uniqueness
        $request->validate([
            'kode_domain' => 'required|max:5|unique:domains,kode_domain,' . $domain->id,
            'nama_domain' => 'required|max:255',
            'deskripsi' => 'nullable'
        ]);

        // Update the domain record with the validated data
        $domain->update($request->all());

        // Redirect to the domain index page with a success message
        return redirect()->route('domain.index')
                         ->with('success', 'Domain berhasil diperbarui');
    }

    /**
     * Remove the specified domain from the database.
     *
     * @param  int  $id The ID of the domain to delete
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Find the domain by ID or fail with 404 error
        $domain = Domain::findOrFail($id);

        // Prevent deletion if the domain has related klausuls
        if($domain->klausuls()->count() > 0) {
            return redirect()->back()
                             ->with('error', 'Tidak dapat menghapus domain yang memiliki klausul');
        }

        // Delete the domain record
        $domain->delete();

        // Redirect to the domain index page with a success message
        return redirect()->route('domain.index')
                         ->with('success', 'Domain berhasil dihapus');
    }

}
