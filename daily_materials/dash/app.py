from dash.react import Dash

my_app = Dash("my app")

from dash_components import h1, PlotlyGraph, TextInput

my_app.layout = div([
                     h1("Hello Data Scientists"),
                     TextInput(
                         label='Stock Traders',
                         value='TSLA',
                         id='my-input'
                     ),
                     PlotlyGraph(
                         figure={
                             'data': [
                                      {'x:'[1,2],'y:',[3,1]}
                             ]
                         },
                         id='my-graph'
                     )
])


import pandas.io.data as web
@my_app.react('my-graph',['my-in'])
def update_graph(stock_ticker_input):
  stock_ticker=stock_ticker_input.value
  df=web.DataReader(stock_ticker,'yahoo')
  figure = {
      'data': [
               {
                'x':df.index,
                'y':df.Open
               }
      ]
  }
  return {'figure':figure}


my_app.server.run(debug=True)