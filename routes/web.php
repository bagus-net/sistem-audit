<?php

use App\Http\Controllers\DomainController;
use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});
// Rute untuk Domain
Route::get('domain', [DomainController::class, 'index'])->name('domain.index');
Route::get('domain/create', [DomainController::class, 'create'])->name('domain.create');
Route::post('domain', [DomainController::class, 'store'])->name('domain.store');
Route::get('domain/{id}', [DomainController::class, 'show'])->name('domain.show');
Route::get('domain/{id}/edit', [DomainController::class, 'edit'])->name('domain.edit');
Route::post('domain/{id}', [DomainController::class, 'update'])->name('domain.update');
Route::delete('domain/{id}', [DomainController::class, 'destroy'])->name('domain.destroy');