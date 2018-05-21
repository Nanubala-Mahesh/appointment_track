class Response
  def success(message, data, token)
    { success: true, message: message, data: data, token: token }
  end

  def failure(message, data)
    { success: false, message: message, data: data }
  end
end
