

# Ropenweather :gem:
Uma gem que encapsula a api do OpenWeatherMap.


## Instalação

Essa gem só se encontra disponivel em desenvolvimento, logo você pode clonar o projeto e instala-la localmente:


```
git clone https://github.com/souzagab/ropenweather.git
cd ropenweather
bundle exec rake install
```
Ou referenciar o repositório em sua Gemfile:
```ruby
gem  'ropenweather', git:  'https://github.com/souzagab/ropenweather.git'
```

E executar:
```
bundle install
```


## Uso
Essa gem usa a api do OpenWeatherMap e você precisa se registrar e pegar suas chaves  [aqui](https://home.openweathermap.org/api_keys).

### Nova instância

Para utilizar essa gem você precisará criar uma instancia da classe `Ropenweather::Client`, seu construtor pode receber estes quatro parâmetros: `api_key, base_uri, lang, units`.

|  parâmetro | obrigatório | valor padrão | valores válidos |
| --- | --- | --- | --- |
| `api_key` | sim || chave de api |
| `base_uri` | não | `http://api.openweathermap.org/data/2.5` | api url |
| `lang` | não | `en` | valores aceitos [aqui](https://openweathermap.org/current#data) |
| `units` | não | `metric` | ``standard metric imperial`` |


#### Exemplo

    client = Ropenweather::Client.new(api_key:'y0ur-4pi-k3y',lang:'pt_br')

###  [Temperatura de Hoje](https://openweathermap.org/current)
Retorna um hash com os parâmetros da temperatura

    client = Ropenweather::Client.new(api_key:'y0ur-4pi-k3y',lang:'pt_br')
    client.get_weather(city:'London')

#### [Previsão](https://openweathermap.org/forecast5) (5 dias)
Retorna um hash com uma lista de previsões para cinco dias

    client = Ropenweather::Client.new(api_key:'y0ur-4pi-k3y',lang:'pt_br')
    response = client.get_weather(city:'London', action:'forecast')
    response[:list] # Array of forecasts


## Desenvolvimento

Após clonar o repositório rode  `bin/setup` para instalar as dependências.
Rode `rake spec` para os testes.
Você também pode rodar `bin/console` para um console interativo.


## Contribuindo

   Este projeto está no inicio do desenvolvimento e tem muito a ser melhorado, contribuições são muito bem vindas, e aqui está uma lista de possivéis melhorias já percebidas

 - [ ] Encapsular a resposta da api em uma classe
 - [ ] Melhorar o tratamento de erros
 - [ ] Validar o formato dos parametros recebidos

E muito mais.

## Licensa

Essa gem possui a licensa [MIT](https://opensource.org/licenses/MIT).


