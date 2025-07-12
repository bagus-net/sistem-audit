<?php

namespace App\Http\Controllers;

use App\Models\Question;
use App\Models\Level;
use Illuminate\Http\Request;

class QuestionController extends Controller
{
    public function index()
    {
        $questions = Question::with('level')->get();
        return view('question.index', compact('questions'));
    }

    public function create()
    {
        $levels = Level::with('klausul')->get();
        return view('question.create', compact('levels'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'level_id' => 'required|exists:levels,id',
            'pertanyaan' => 'required|array|min:1',
            'pertanyaan.*' => 'required|string',
        ]);
        foreach ($validated['pertanyaan'] as $pertanyaan) {
            Question::create([
                'level_id' => $validated['level_id'],
                'pertanyaan' => $pertanyaan,
            ]);
        }
        return redirect()->route('question.index')->with('success', 'Pertanyaan berhasil ditambahkan');
    }

    public function show($id)
    {
        $question = Question::with('level')->findOrFail($id);
        return response()->json($question);
    }

    public function edit($id)
    {
        $question = Question::findOrFail($id);
        $levels = Level::with('klausul')->get();
        return view('question.edit', compact('question', 'levels'));
    }

    public function update(Request $request, $id)
    {
        $question = Question::findOrFail($id);
        $validated = $request->validate([
            'level_id' => 'required|exists:levels,id',
            'pertanyaan' => 'required|string',
        ]);
        $question->update($validated);
        return redirect()->route('question.index')->with('success', 'Pertanyaan berhasil diupdate');
    }

    public function destroy($id)
    {
        $question = Question::findOrFail($id);
        $question->delete();
        return redirect()->route('question.index')->with('success', 'Pertanyaan berhasil dihapus');
    }
}
