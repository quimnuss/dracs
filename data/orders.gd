extends Resource
class_name Orders

# difficulty higher = harder

const orders_dict : Dictionary[String, Dictionary] = {
    "senyera" : {
        "order_long": "Voldria cinc roses fent la senyera!",
        "order_short": "5 roses alternant groc i vermell",
        "difficulty": 3,
        "ram": {
            "flowers" : [Color.YELLOW, Color.RED, Color.YELLOW, Color.RED, Color.YELLOW],
            "paper" : 1,
            "ribbon" : Color.RED
        },
        "price": 5
    },
    "senyera_invertida" : {
        "order_long": "Voldria cinc roses fent la senyera! Però invertida",
        "order_short": "5 roses alternant groc i vermell",
        "difficulty": 4,
        "ram": {
            "flowers" : [Color.RED, Color.YELLOW, Color.RED, Color.YELLOW, Color.RED],
            "paper" : 1,
            "ribbon" : Color.YELLOW
        },
        "price": 5
    },
    "guiri" : {
        "order_long": "Hello! Una ramo de fulores, please. Mucho rojo!",
        "order_short": "4 roses vermelles",
        "difficulty": 2,
        "ram": {
            "flowers" : [Color.RED, Color.RED, Color.RED, Color.RED],
            "paper" : 1,
            "ribbon" : Color.RED
        },
        "price": 5
    },
    "culer" : {
        "order_long": "Bon dia! Sóc del Barça! Ja saps què vull… heh.",
        "order_short": "5 roses alternant blau i vermell",
        "difficulty": 3,
        "ram": {
            "flowers" : [Color.BLUE, Color.RED, Color.BLUE, Color.RED, Color.BLUE],
            "paper" : 1,
            "ribbon" : Color.RED
        },
        "price": 5
    },
  "catalanet" : {
        "order_long": "Bona diada! Per mi, clàssic. Rosa i espiga!",
        "order_short": "1 rosa vermella.",
        "difficulty": 0,
        "ram": {
            "flowers" : [Color.RED],
            "paper" : 1,
            "ribbon" : Color.RED
        },
        "price": 1
    },

  "erudit" : {
        "order_long": "Bona diada! Doncs la veritat és que m'agraden moltes roses. Però aquesta vegada, amb una única rosa que m'il·lumini com el sol ja en estaré content",
        "order_short": "1 rosa groga.",
        "difficulty": 0,
        "ram": {
            "flowers" : [Color.YELLOW],
            "paper" : 1,
            "ribbon" : Color.YELLOW
        },
        "price": 1
    },
}


static func ordername_to_order(ordername : String) -> Order:
    
    var color_translate : Dictionary[Color, Color] = {
        Color.RED : Rose.rose_map['RoseRed'],
        Color.WHITE : Rose.rose_map['RoseWhite'],
        Color.YELLOW : Rose.rose_map['RoseYellow'],
        Color.BLUE : Rose.rose_map['RoseBlue'],
    }
    
    if not ordername:
        print('ordername is empty')
        return null
    var order_dict = orders_dict[ordername]
    var order : Order = Order.new()
    order.order_long = order_dict['order_long']
    order.order_short = order_dict['order_short']
    order.difficulty = order_dict['difficulty']
    for flower_color : Color in order_dict['ram']['flowers']:
        order.flowers.append(color_translate[flower_color])
    order.paper = order_dict['ram']['paper']
    order.ribbon = order_dict['ram']['ribbon']
    order.price = order_dict['price']
    return order
    
