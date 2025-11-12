class FontIconMapper
  ICON_MAPPER = {
    "church" => "fa-solid fa-church",
    "user" => "fa-solid fa-user",
    "users" => "fa-solid fa-user-group",
    "message" => "fa-solid fa-message",
    "settings" => "fa-solid fa-wrench",
    "logout" => "fa-solid fa-right-from-bracket",
    "question" => "fa-solid fa-circle-question",
    "show" => "fa-solid fa-eye",
    "edit" => "fa-solid fa-pen-to-square",
    "add" => "fa-solid fa-square-plus",
    "clipboard" => "fa-solid fa-clipboard-user",
    "calendar" => "fa-solid fa-calendar-days",
    "file" => "fa-solid fa-file-invoice",
    "qr_code" => "fa-solid fa-qrcode"
  }

  FALLBACK_ICON = ICON_MAPPER["question"]

  def self.find(icon_name)
    ICON_MAPPER[icon_name.to_s] || FALLBACK_ICON
  end
end
