module CallApi
  require 'json'
  require 'net/http'
  require 'uri'
  require 'digest/sha2'
  def self.post(url, set_request_body, request_header)
    uri                 = URI.parse(url)
    http                = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl        = false
    http.verify_mode    = OpenSSL::SSL::VERIFY_NONE
    req                 = Net::HTTP::Post.new(uri.path, request_header)
    req.body            = set_request_body.to_json
    response            = http.request(req)
    JSON.parse(response.body.force_encoding("utf-8")) rescue nil #JSONパースエラーが発生するためrescue nilの処理を入れておく
  end
end
# 簡単に外部APIを呼び出してくれるやつBy春田さん
# コピペで送っていただいている内容
