<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class FkLelangTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('lelang', function (Blueprint $table) {
            $table->foreign('barang_id')->references('id')->on('barang')->onDelete('cascade');
            $table->foreign('penawaran_id')->references('id')->on('penawaran')->onDelete('cascade');
            $table->foreign('petugas_id')->references('id')->on('petugas')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('lelang', function (Blueprint $table) {
            //
        });
    }
}
