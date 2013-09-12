require 'spec_helper'

describe NumbersayerController do
  context 'GET show' do
    before(:each) do
      get :show
    end

    it 'should be succeessful' do
      response.should be_success
    end
  end

  context 'POST calculate' do
    it 'should not throw routing error' do
      expect do
        post :calculate, calculate: {}
      end.to_not raise_error
    end

    context 'via HTML' do
      context 'with empty data' do
        before(:each) do
          post :calculate, calculate: { number: '' }
        end
        it 'should display alert' do
          flash[:alert].should eq("You didn't specified any number!")
        end

        it 'should redirect to root' do
          response.should redirect_to root_path
        end
      end

      context 'with invalid data' do 
        before(:each) do
          post :calculate, calculate: { number: 'foobar' }
        end

        it 'should display alert' do
          flash[:alert].should eq("'foobar' is not a number!")
        end
        
        it 'should redirect to root' do
          response.should redirect_to root_path
        end
      end

      context 'with valid data' do
        context 'UK' do
          before(:each) do
            post :calculate, calculate: { number: '4242', locale: 'uk' }
          end

          it 'should be successful' do
            response.should be_success
          end

          it 'should not redirect' do
            response.should_not be_redirect
          end

          it 'should assign response' do
            assigns[:reply].should eq 'four thousand and two hundred and fourty-two'
          end
        end

        context 'US' do
          before(:each) do
            post :calculate, calculate: { number: '4242', locale: 'us' }
          end

          it 'should be successful' do
            response.should be_success
          end

          it 'should not redirect' do
            response.should_not be_redirect
          end

          it 'should assign response' do
            assigns[:reply].should eq 'four thousand, two hundred fourty-two'
          end
        end
      end
    end

    context 'via JSON' do
      context 'with empty data' do 
        before(:each) do
          post :calculate, calculate: { number: '' }, format: :json
        end

        it 'should response with HTTP 422' do
          response.response_code.should eq 422
        end

        it 'should render an error' do
          response.body.should == { error: "You didn't specified any number!" }.to_json
        end
      end
      
      context 'with invalid data' do
        before(:each) do
          post :calculate, calculate: { number: 'foobar' }, format: :json
        end

        it 'should response with HTTP 422' do
          response.response_code.should eq 422
        end

        it 'should render an error' do
          response.body.should == { error: "'foobar' is not a number!" }.to_json
        end
      end

      context 'with valid data' do
        before(:each) do
          post :calculate, calculate: { number: '42', locale: 'uk' }, format: :json
        end

        it 'should be successful' do
          response.should be_success
        end

        it 'should be render reply' do
          response.body.should eq({reply: 'fourty-two'}.to_json)
        end
      end
    end
  end
end
