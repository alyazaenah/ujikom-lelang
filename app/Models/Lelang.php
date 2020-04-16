<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Lelang
 * 
 * @property int $id
 * @property int $barang_id
 * @property int $penawaran_id
 * @property int $petugas_id
 * @property bool $status
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property Barang $barang
 * @property Penawaran $penawaran
 * @property Petuga $petuga
 *
 * @package App\Models
 */
class Lelang extends Model
{
	protected $table = 'lelang';

	protected $casts = [
		'barang_id' => 'int',
		'penawaran_id' => 'int',
		'petugas_id' => 'int',
		'status' => 'bool'
	];

	protected $fillable = [
		'barang_id',
		'penawaran_id',
		'petugas_id',
		'status'
	];

	public function barang()
	{
		return $this->belongsTo(Barang::class);
	}

	public function penawaran()
	{
		return $this->belongsTo(Penawaran::class);
	}

	public function petuga()
	{
		return $this->belongsTo(Petuga::class, 'petugas_id');
	}
}
