class LoginPage
  include PageObject
  include DataMagic

  page_url FigNewton.base_url
  #page_url("http://dev--platform-dev-rpati.dev.buddymedia.com")

  text_field(:email, :id => 'email')
  text_field(:password, :id => 'password')
  button(:signin, :id => 'login_submit')
  li(:error, :class => 'error')

  def input_login_credentials(data = {})
    populate_page_with data_for(:login_page, data)
  end
end