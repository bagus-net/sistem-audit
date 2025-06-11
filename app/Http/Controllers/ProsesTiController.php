<?php

namespace App\Http\Controllers;

use App\Models\ProsesTi;
use App\Models\Klausul;
use App\Models\Domain;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

/**
 * Controller for managing ProsesTi (IT Process) operations.
 * This controller handles the CRUD operations for IT process questions and their relationships with domains and klausuls.
 */
class ProsesTiController extends Controller
{
    /**
     * Display a listing of all IT processes.
     * Eager loads the klausul relationship for optimization.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Retrieve all proses_ti records with their related klausul data with pagination
        $prosesTis = ProsesTi::with(['klausul', 'domain'])->paginate(10);
        return view('proses_ti.index', compact('prosesTis'));
    }

    /**
     * Show the form for creating a new IT process.
     * Loads all domains and klausuls for the selection dropdowns.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // Get all klausuls and domains for the form dropdowns
        $klausuls = Klausul::all();
        $domains = Domain::all();
        return view('proses_ti.create', compact('klausuls', 'domains'));
    }

    /**
     * Store a newly created IT process in the database.
     * Generates the kode_proses based on domain and klausul information.
     *
     * @param  \Illuminate\Http\Request  $request Incoming request with process data
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Validate the incoming request data
        $request->validate([
            'domain_id' => 'required|exists:domains,id',
            'klausul_id' => 'required|exists:klausuls,id',
            'level' => 'required|integer',
            'nama_proses' => 'required|max:255',
            'pertanyaan' => 'required',
        ]);

        // Retrieve the domain and klausul for kode_proses generation
        $domain = Domain::findOrFail($request->domain_id);
        $klausul = Klausul::findOrFail($request->klausul_id);

        // Store only the domain code in kode_proses
        $prosesTi = ProsesTi::create(array_merge($request->all(), ['kode_proses' => $domain->kode_domain]));

        // Redirect to the index page with a success message
        return redirect()->route('proses_ti.index')
                         ->with('success', 'Pertanyaan berhasil ditambahkan');
    }

    /**
     * Display the specified IT process.
     * Eager loads the klausul relationship for the detailed view.
     *
     * @param  int  $id The ID of the process to display
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // Find the proses_ti record with its related klausul data
        $prosesTi = ProsesTi::with('klausul')->findOrFail($id);
        return view('proses_ti.show', compact('prosesTi'));
    }

    /**
     * Show the form for editing the specified IT process.
     * Loads all domains and klausuls for the selection dropdowns.
     *
     * @param  int  $id The ID of the process to edit
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // Find the proses_ti record and get all klausuls and domains for the form
        $prosesTi = ProsesTi::findOrFail($id);
        $klausuls = Klausul::all();
        $domains = Domain::all();
        return view('proses_ti.edit', compact('prosesTi', 'klausuls', 'domains'));
    }

    /**
     * Update the specified IT process in the database.
     * Regenerates the kode_proses if domain or klausul has changed.
     *
     * @param  \Illuminate\Http\Request  $request Incoming request with updated data
     * @param  int  $id The ID of the process to update
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // Find the proses_ti record
        $prosesTi = ProsesTi::findOrFail($id);

        // Validate the incoming request data
        $request->validate([
            'domain_id' => 'required|exists:domains,id',
            'klausul_id' => 'required|exists:klausuls,id',
            'level' => 'required|integer',
            'nama_proses' => 'required|max:255',
            'pertanyaan' => 'required',
        ]);

        // Retrieve the domain and klausul for kode_proses generation
        $domain = Domain::findOrFail($request->domain_id);
        $klausul = Klausul::findOrFail($request->klausul_id);

        // Store only the domain code in kode_proses
        $prosesTi->update(array_merge($request->except('kode_proses'), ['kode_proses' => $domain->kode_domain]));

        // Redirect to the index page with a success message
        return redirect()->route('proses_ti.index')
                         ->with('success', 'Pertanyaan berhasil diperbarui');
    }

    /**
     * Remove the specified IT process from the database.
     *
     * @param  int  $id The ID of the process to delete
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Find and delete the proses_ti record
        $prosesTi = ProsesTi::findOrFail($id);
        $prosesTi->delete();

        // Redirect to the index page with a success message
        return redirect()->route('proses_ti.index')
                         ->with('success', 'Pertanyaan berhasil dihapus');
    }

    /**
     * Retrieve domain name for AJAX requests.
     * Used for auto-filling domain information in forms.
     *
     * @param  int  $id The ID of the domain to retrieve
     * @return \Illuminate\Http\JsonResponse
     */
    public function getDomain($id)
    {
        // Find the domain record
        $domain = Domain::find($id);
        if ($domain) {
            return response()->json([
                'nama_domain' => $domain->nama_domain,
            ]);
        } else {
            return response()->json(['error' => 'Domain not found'], 404);
        }
    }

    /**
     * Retrieve klausul name for AJAX requests.
     * Used for auto-filling klausul information in forms.
     *
     * @param  int  $id The ID of the klausul to retrieve
     * @return \Illuminate\Http\JsonResponse
     */
    public function getKlausul($id)
    {
        // Find the klausul record
        $klausul = Klausul::find($id);
        if ($klausul) {
            return response()->json([
                'nama_klausul' => $klausul->nama_klausul,
            ]);
        } else {
            return response()->json(['error' => 'Klausul not found'], 404);
        }
    }
}
