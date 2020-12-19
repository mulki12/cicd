<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function home(Request $request) {

        $banner = new BannerController();
        $banners = $banner->show($request);

        $kategori_jasa = new KategoriJasaController();
        $jasa = $kategori_jasa->show($request);

        $kategori_ppob = new KategoriPPOBController();
        $ppob = $kategori_ppob->show($request);

        $info = new InfoController();
        $infos = $info->show($request);

        return response()->json([
            'status' => true,
            'message' => 'success',
            'data' => [
                'banners' => $banners->original['data'] ?? null,
                'kategori_jasa' => $jasa->original['data'] ?? null,
                'kategori_ppob' => $ppob->original['data'] ?? null,
                'info' => $infos->original['data'] ?? null,
                'notifications' => $notifications ?? null
            ]
        ]);

    }
}
