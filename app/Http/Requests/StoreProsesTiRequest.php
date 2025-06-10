<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreProsesTiRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules() {
    return [
        'klausul_id' => 'required|exists:klausuls,id',
        'kode_proses' => 'required|unique:proses_ti|max:20',
        'nama_proses' => 'required|max:255',
        'level' => 'required|in:Level 2,Level 3,Level 4,Level 5',
        'pertanyaan' => 'required'
    ];
}
}
