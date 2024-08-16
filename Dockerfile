# Use uma imagem oficial do Ruby como base
FROM ruby:3.2.2

# Instale dependências
RUN apt-get update -qq && apt-get install -y nodejs yarn libmariadb-dev-compat libmariadb-dev

# Configure o diretório de trabalho
WORKDIR /Rails-Only

COPY wait-for-it.sh /Rails-Only/wait-for-it.sh
RUN chmod +x /Rails-Only/wait-for-it.sh

# Copie o Gemfile e o Gemfile.lock para o container
COPY Gemfile Gemfile.lock ./

# Instale as gems
RUN bundle install

# Copie o restante do código da aplicação
COPY . .

# Exponha a porta para o servidor
EXPOSE 3000

# Comando de inicialização
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"]
