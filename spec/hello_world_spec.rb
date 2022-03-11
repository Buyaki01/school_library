require_relative '../hello_world'
describe HelloWorld do
  context 'when testing the helloworld class' do
    it 'should say hello world when we call the say_hello method' do
      hw = HelloWorld.new
      message = hw.say_hello
      expect(message).to eq 'Hello World!'
    end
  end
end
