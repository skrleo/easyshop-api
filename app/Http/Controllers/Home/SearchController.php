<?php


namespace App\Http\Controllers\Home;


use App\Http\Controllers\Controller;
use App\Logic\Home\SearchLogic;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    /**
     * @param Request $request
     * @return mixed
     */
    public function lists(Request $request)
    {
        return SearchLogic::lists($request->all());
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\RJsonError
     */
    public function store(Request $request)
    {
        $this->validate($request->all(), [
            'keyword' => 'required|string',
        ]);

        return SearchLogic::store($request->all());
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(Request $request)
    {
        return (new SearchLogic())->destroy($request->all());
    }

}
