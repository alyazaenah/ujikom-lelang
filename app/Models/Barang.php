<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Barang
 * 
 * @property int $id
 * @property int $user_id
 * @property string $nama_barang
 * @property string $deskripsi_barang
 * @property int $harga_awal
 * @property string $edit_history
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property User $user
 * @property Collection|Lelang[] $lelangs
 * @property Collection|Penawaran[] $penawarans
 *
 * @package App\Models
 */
class Barang extends Model
{
	protected $table = 'barang';

	protected $casts = [
		'user_id' => 'int',
		'harga_awal' => 'int'
	];

	protected $fillable = [
		'user_id',
		'nama_barang',
		'deskripsi_barang',
		'harga_awal',
		'edit_history'
	];

	public function user()
	{
		return $this->belongsTo(User::class);
	}

	public function lelangs()
	{
		return $this->hasMany(Lelang::class);
	}

	public function penawarans()
	{
		return $this->hasMany(Penawaran::class);
	}
}
