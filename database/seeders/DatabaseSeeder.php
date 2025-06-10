<?php

namespace Database\Seeders;

use App\Models\Domain;
use App\Models\klausul;
use App\Models\ProsesTi;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run() {
    // Seed domains
    $domains = [
        ['kode_domain' => 'EDM', 'nama_domain' => 'Evaluate, Direct and Monitor'],
        ['kode_domain' => 'APO', 'nama_domain' => 'Align, Plan and Organize'],
        // ... tambahkan domain lain
    ];
    
    foreach ($domains as $domain) {
        Domain::create($domain);
    }

    // Seed klausul untuk APO
    $apo = Domain::where('kode_domain', 'APO')->first();
    $klausuls = [
        ['domain_id' => $apo->id, 'kode_klausul' => 'K.4', 'nama_klausul' => 'Konteks Organisasi'],
        ['domain_id' => $apo->id, 'kode_klausul' => 'K.5', 'nama_klausul' => 'Kepemimpinan'],
        // ... tambahkan klausul lain
    ];
    
    foreach ($klausuls as $klausul) {
        klausul::create($klausul);
    }

    // Seed proses TI untuk K.4
    $k4 = Klausul::where('kode_klausul', 'K.4')->first();
    $prosesList = [
        [
            'klausul_id' => $k4->id,
            'kode_proses' => 'APO01.01',
            'nama_proses' => 'Merancang sistem manajemen TI',
            'level' => 'Level 2',
            'pertanyaan' => 'Memahami visi, strategi, dan tantangan perusahaan saat ini?'
        ],
        // ... tambahkan proses lain sesuai excel
    ];
    
    foreach ($prosesList as $proses) {
        ProsesTi::create($proses);
    }
}}