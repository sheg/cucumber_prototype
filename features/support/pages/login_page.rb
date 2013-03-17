class LoginPage
  include PageObject
  include DataMagic

  page_url FigNewton.base_url

  text_field(:email, :id => 'email')
  text_field(:password, :id => 'password')
  button(:signin, :id => 'login_submit')
  li(:error, :class => 'error')

  def input_login_credentials(email = FigNewton.login.email, password = FigNewton.login.password)
    self.email = email
    self.password = password
  end
end