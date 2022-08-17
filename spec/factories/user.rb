FactoryBot.define do
  factory :user do
    nickname              { '田中太郎' }
    email                 { 'test@example' }
    password              { '123456a' }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '田中' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'タナカ' }
    birthday              { '2000-01-01 00:00:00' }
  end
end
