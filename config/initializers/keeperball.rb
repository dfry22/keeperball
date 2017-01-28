Keeperball::Application.configure do
  config.domain = 'friedgoods.com'

  config.google_auth = Rails.application.secrets.google_auth
  config.google_sheet_id = Rails.application.secrets.google_drive[:sheet_id]

  config.yahoo_league_ids = { 2016 => '353.l.61815', 2017 => '364.l.76053' }
  config.yahoo_game_ids = { 2016 => '353', 2017 => '364' }
  config.current_year = 2017
end