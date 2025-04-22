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
    
  "descolorit" : {
        "order_long": "Estic com indefinit. Una rosa per fer, descolorida.",
        "order_short": "1 rosa blanca.",
        "difficulty": 0,
        "ram": {
            "flowers" : [Color.WHITE],
            "paper" : 1,
            "ribbon" : Color.YELLOW
        },
        "price": 1
    },

  "tresina" : {
        "order_long": "Voldria una rosa de cada color. Ben ordenades de més a menys!",
        "order_short": "1 rosa vermella, groga, blava i blanca.",
        "difficulty": 0,
        "ram": {
            "flowers" : [Color.RED,Color.YELLOW,Color.BLUE,Color.WHITE],
            "paper" : 1,
            "ribbon" : Color.YELLOW
        },
        "price": 5
    },
    
    "sang" : {
        "order_long": "Una rosa vermella com la sang!",
        "order_short": "1 rosa vermella.",
        "difficulty": 0,
        "ram": {
            "flowers" : [Color.RED],
            "paper" : 1,
            "ribbon" : Color.YELLOW
        },
        "price": 1
    },

    "trist" : {
        "order_long": "Trobo que fa un dia ben trist avui. Què em recomanaríeu?",
        "order_short": "1 rosa blava.",
        "difficulty": 0,
        "ram": {
            "flowers" : [Color.BLUE],
            "paper" : 1,
            "ribbon" : Color.YELLOW
        },
        "price": 1
    },
    
    "parella" : {
        "order_long": "Una rosa per la meva parella Blanca i després una altra per a mi! Estem ben enamorades!",
        "order_short": "Una rosa blanca i una de vermella.",
        "difficulty": 0,
        "ram": {
            "flowers" : [Color.WHITE, Color.RED],
            "paper" : 1,
            "ribbon" : Color.YELLOW
        },
        "price": 1
    },
    
    "trio" : {
        "order_long": "Una rosa per les meves parelles i una altra per a mi! Estem ben enamorades!",
        "order_short": "Tres roses vermelles.",
        "difficulty": 0,
        "ram": {
            "flowers" : [Color.RED, Color.RED, Color.RED],
            "paper" : 1,
            "ribbon" : Color.YELLOW
        },
        "price": 1
    },
    
    "piroman" : {
        "order_long": "Jo és que ho cremaria tot. Posa'm dues roses.",
        "order_short": "Una rosa vermella i una de groga.",
        "difficulty": 0,
        "ram": {
            "flowers" : [Color.RED, Color.YELLOW],
            "paper" : 1,
            "ribbon" : Color.YELLOW
        },
        "price": 2
    },
    
    "pluja" : {
        "order_long": "Ara pla. Per Sant Jordi sempre plou. Que no se'm descolori la rosa tu.",
        "order_short": "Una rosa blanca i una de blava.",
        "difficulty": 0,
        "ram": {
            "flowers" : [Color.WHITE, Color.BLUE],
            "paper" : 1,
            "ribbon" : Color.YELLOW
        },
        "price": 2
    },
    
    "perico" : {
        "order_long": "Blanc i blau! Que sóc perico!",
        "order_short": "Una rosa blanca i una de blava.",
        "difficulty": 0,
        "ram": {
            "flowers" : [Color.WHITE, Color.BLUE],
            "paper" : 1,
            "ribbon" : Color.YELLOW
        },
        "price": 2
    },
    
    "tripletrist" : {
        "order_long": "Jo és que em poso trist, molt trist.",
        "order_short": "Tres roses blaves.",
        "difficulty": 0,
        "ram": {
            "flowers" : [Color.BLUE, Color.BLUE, Color.BLUE],
            "paper" : 1,
            "ribbon" : Color.YELLOW
        },
        "price": 4
    },
    
    "aigua" : {
        "order_long": "M'encanta la vista del mar, amb el cel a sobre",
        "order_short": "Una rosa groga i dues de blaves.",
        "difficulty": 0,
        "ram": {
            "flowers" : [Color.YELLOW, Color.BLUE, Color.BLUE],
            "paper" : 1,
            "ribbon" : Color.YELLOW
        },
        "price": 4
    },
    
    "groc" : {
        "order_long": "Ben groc! Com la pell del meu estimat.",
        "order_short": "Tres roses grogues.",
        "difficulty": 0,
        "ram": {
            "flowers" : [Color.YELLOW, Color.YELLOW, Color.YELLOW],
            "paper" : 1,
            "ribbon" : Color.YELLOW
        },
        "price": 4
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
    
