namespace :dev do
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Cadastrando o administrador padrão...") { %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando administradores extras...") { %x(rails dev:add_extra_admins) }
      show_spinner("Cadastrando o usuário padrão...") { %x(rails dev:add_default_user) }
      show_spinner("Cadastrando os assuntos padrão...") { %x(rails dev:add_subjects) }
      show_spinner("Cadastrando as perguntas e respostas...") { %x(rails dev:add_questions_and_answers) }
    else
      puts "Você não está em ambiente de desenvolvimento."
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: 'admadm',
      password_confirmation: 'admadm',
    )
  end

  desc "Adiciona outros administradores"
  task add_extra_admins: :environment do
    10.times do |i|
      Admin.create!(
        email: Faker::Internet::email,
        password: 'admadm',
        password_confirmation: 'admadm',
      )
    end
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: 123456,
      password_confirmation: 123456,
    )
  end

  desc "Adiciona a coleção padrão de assuntos"
  task add_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
    end
  end

  desc "Cadastra as perguntas e respostas"
  task add_questions_and_answers: :environment do
    Subject.all.each do |subject|
      rand(1..3).times do |i|
        params = create_question_params(subject)
        answers_array = params[:question][:answers_attributes]

        add_answers(answers_array)
        elect_correct_answer(answers_array)

        Question.create!(params[:question])
      end
    end
  end


  private

  def show_spinner(msg_start, msg_end="Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

  def create_question_params(subject = Subject.all.sample)
    {
      question: {
        description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
        subject: subject,
        answers_attributes: []
      }
    }
  end

  def create_answer_params()
    { description: Faker::Lorem.sentence, correct: false }
  end

  def add_answers(answers_array = [])
    rand(2..5).times do |j|
      answers_array.push(create_answer_params())
    end
  end

  def elect_correct_answer(answers_array = [])
    correct_answer_index = rand(answers_array.size)
    answers_array[correct_answer_index][:correct] = true
  end
end
