<?php

use App\Http\Controllers\DomainController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\AuthController; // Moved outside the comment block

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::get('/register', [AuthController::class, 'showRegistrationForm'])->name('register');
Route::post('/register', [AuthController::class, 'register']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

Route::get('/', function () {
    return view('welcome');
});

use App\Http\Controllers\UserController;

Route::resource('users', UserController::class);
// Rute untuk Domain
Route::get('domain', [DomainController::class, 'index'])->name('domain.index');
Route::get('domain/create', [DomainController::class, 'create'])->name('domain.create');
Route::post('domain', [DomainController::class, 'store'])->name('domain.store');
Route::get('domain/{id}', [DomainController::class, 'show'])->name('domain.show');
Route::get('domain/{id}/edit', [DomainController::class, 'edit'])->name('domain.edit');
Route::post('domain/{id}', [DomainController::class, 'update'])->name('domain.update');
Route::delete('domain/{id}', [DomainController::class, 'destroy'])->name('domain.destroy');

// Rute untuk ProsesTi (Pertanyaan)
use App\Http\Controllers\ProsesTiController;

Route::get('proses_ti', [ProsesTiController::class, 'index'])->name('proses_ti.index');
Route::get('proses_ti/create', [ProsesTiController::class, 'create'])->name('proses_ti.create');
Route::post('proses_ti', [ProsesTiController::class, 'store'])->name('proses_ti.store');
Route::get('proses_ti/{id}', [ProsesTiController::class, 'show'])->name('proses_ti.show');
Route::get('proses_ti/{id}/edit', [ProsesTiController::class, 'edit'])->name('proses_ti.edit');
Route::post('proses_ti/{id}', [ProsesTiController::class, 'update'])->name('proses_ti.update');
Route::delete('proses_ti/{id}', [ProsesTiController::class, 'destroy'])->name('proses_ti.destroy');
Route::get('proses_ti/get-domain/{id}', [ProsesTiController::class, 'getDomain'])->name('proses_ti.getDomain');
Route::get('proses_ti/get-klausul/{id}', [ProsesTiController::class, 'getKlausul'])->name('proses_ti.getKlausul');

// Rute untuk Klausul
use App\Http\Controllers\KlausulController;

Route::get('klausul', [KlausulController::class, 'index'])->name('klausul.index');
Route::get('klausul/create', [KlausulController::class, 'create'])->name('klausul.create');
Route::post('klausul', [KlausulController::class, 'store'])->name('klausul.store');
Route::get('klausul/{id}', [KlausulController::class, 'show'])->name('klausul.show');
Route::get('klausul/{id}/edit', [KlausulController::class, 'edit'])->name('klausul.edit');
Route::post('klausul/{id}', [KlausulController::class, 'update'])->name('klausul.update');
Route::delete('klausul/{id}', [KlausulController::class, 'destroy'])->name('klausul.destroy');
Route::get('klausul/json/{id}', [KlausulController::class, 'getKlausul'])->name('klausul.getKlausul');
