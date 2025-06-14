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
            $table->unsignedBigInteger('domain_id')->nullable();
    $table->foreign('domain_id')->references('id')->on('domains')->onDelete('set null');
    $table->unsignedBigInteger('klausul_id')->nullable();
    $table->foreign('klausul_id')->references('id')->on('klausuls')->onDelete('set null');
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
       Schema::table('proses_tis', function (Blueprint $table) {
    $table->dropForeign(['domain_id']);
    $table->dropColumn('domain_id');
    $table->dropForeign(['klausul_id']);
    $table->dropColumn('klausul_id');
});

    }}
