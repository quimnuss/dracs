extends Resource
class_name Orders

# difficulty higher = harder

const orders_dict : Dictionary = {
    'senyera' : {
        'order_long': 'Voldria nou roses fent la senyera!',
        'order_short': '9 roses alternant groc i vermell',
        'difficulty': 0,
        'ram': {
            'flowers' : [Color.YELLOW, Color.RED, Color.YELLOW, Color.RED, Color.YELLOW, Color.RED, Color.YELLOW, Color.RED],
            'paper' : 1,
            'ribbon' : Color.RED
        },
        'price': 20
    },
    'senyera_invertida' : {
        'order_long': 'Voldria nou roses fent la senyera! Però invertida',
        'order_short': '9 roses alternant groc i vermell',
        'difficulty': 0,
        'ram': {
            'flowers' : [Color.RED, Color.YELLOW, Color.RED, Color.YELLOW, Color.RED, Color.YELLOW, Color.RED, Color.YELLOW],
            'paper' : 1,
            'ribbon' : Color.YELLOW
        },
        'price': 25
    },
}

static func ordername_to_order(ordername : String) -> Order:
    if not ordername:
        print('ordername is empty')
        return null
    var order_dict = orders_dict[ordername]
    var order : Order = Order.new()
    order.order_long = order_dict['order_long']
    order.order_short = order_dict['order_short']
    order.difficulty = order_dict['difficulty']
    order.flowers.assign(order_dict['ram']['flowers'])
    order.paper = order_dict['ram']['paper']
    order.ribbon = order_dict['ram']['ribbon']
    order.price = order_dict['price']
    return order
    
