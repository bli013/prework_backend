require 'rails_helper'



RSpec.describe CodeModulesController, type: :controller do

#Crud tests
#Variable example_user is to create a mock user to be used with devise.

    let!(:example_user) {User.create(email: 'test@test.test', password: 'password', password_confirmation: 'password')}

#Test for index authorization
    describe 'GET #index', type: :request do
        it 'rejects the request when the user is not signed in' do
            get '/code_modules'
            expect(response.status).to eq(403)
            expect(response.body).to eq("Please Sign In to Access")
        end
    end

#Test for show authorization
    describe 'GET #show', type: :request do
    it 'rejects the request to see a single module if no user is signed in' do
            get '/code_modules/1'
            expect(response.status).to eq(403)
            expect(response.body).to eq("Please Sign In to Access")
        end
    end

#Test for create authorization
    describe 'POST #create', type: :request do
    it 'should reject new code_module creation if no user is signed in' do
        post "/code_modules"
        expect(response.status).to eq(403)
        expect(response.body).to eq("Please Sign In to Access")
        end


    # Does not currently work. 
    # it 'returns errors for invalid code_module creation' do
    #     sign_in example_user
    #     codeModule_params = {
    #         codeModule: {
    #             lesson: '',
    #             progress: 0,
    #             completed: false,
    #             user_id: ''
    #         }
    #     }
    #     post '/code_modules', params: codeModule_params
    #     json = JSON.parse(response.body)
    #     expect(response.status).to eq(422)
    #     expect(json['lesson']).to include "can't be blank"
    # end

    end

#Test for update authorization
    describe 'PUT #update', type: :request do
        it 'should reject request if no user is signed in' do
            put "/code_modules/1"
            expect(response.status).to eq(403)
            expect(response.body).to eq("Please Sign In to Access")
        end
    end

#Test for delete authorization
    describe 'DELETE #destroy', type: :request do
    it 'should reject requests if no user is signed in' do
        delete "/code_modules/1"
        expect(response.status).to eq(403)
        expect(response.body).to eq("Please Sign In to Access")
        end
    end

end
