class HomeController < ApplicationController

  def top
  end

  def check
    # puts params
    # 今は何を入力しても下の配列が入れられる状態
    # 入れた文字列を読み込む形式に変更
    # リクエストを動的にする
    # ハッシュと配列の意味と取り出し方を考える
    # ["H1 H13 H12 H11 H10"]の部分だけ変える

    # request_body = {cards: ["H1 H13 H12 H11 H10"]}
    request_body = {cards: [params[:cards]]}

    request_header = {"Content-Type" => "application/json"}

    url = 'http://p0kerhands.herokuapp.com/api/v1/cards/check'
    response = CallApi.post(url, request_body, request_header)

    # data = {"result"=>[{"card"=>"C10 C5 C4 C11 C7", "hand"=>"フラッシュ", "best"=>true}]}
    # @yaku = response[result: "hand"]
    if response["result"]
      @yaku = response["result"][0]["hand"]
    else
      @yaku = response["error"][0]["msg"]
    end

    # yaku_params
    # @yaku = response
  end

  def yaku_params
    params["cards"]
  end
end
