<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProsesTisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('proses_tis', function (Blueprint $table) {
            $table->id();
            $table->foreignId('klausul_id')->constrained();
            $table->string('kode_proses', 20); // APO01.01, BAI06.01
            $table->string('nama_proses'); // Manage IT Management Framework
            $table->string('level', 10); // Level 2, 3, 4, 5
            $table->text('pertanyaan'); // Pertanyaan audit
            $table->text('referensi')->nullable(); // Referensi COBIT
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('proses_tis');
    }
}
