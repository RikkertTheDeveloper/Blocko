<p align="center"><img width=90 src="https://provider.ams3.cdn.digitaloceanspaces.com/blocko-icon.svg"/></p>

<h2 align="center"><b>Blocko Analytics</b></h2>
<p align="center"><b>By <a href="https://github.com/u/rikkertthedeveloper">Rick Arendsen</a></b></p>

### 🤍 Blocko Introduction
Welcome to Blocko, your tiny ~1.33 KB analytics buddy that can easily help you track player interactions in-game using an easy-to-use SDK that can be easily integrated with
your own systems.
<br>
<br>

### 📝 How to use Blocko
To use blocko, you will need an account and key over at https://www.blocko-analytics.io, you can then use your given Blocko key to send requests to your analytics endpoint to start
collecting information about what's happening inside of your game!
<br>
<br>

### 📙 Usage Example
Imagine a scenario where we would like to track the amount of times that a trade has been initiated inside of our game. We could use the following code to send information to the analytics endpoint:

```lua
Blocko:Queue({
    ["Type"] = "TradeCompleted",
    ["Value"] = {Player1.UserId, Player2.UserId},
    ["Meta"] = {
        ["Items"] = MyTrade:GetItems(),
        ["TotalValue"] = TradeManager:GetItemsValue(MyTrade:GetItems())
    }
})
```

Upon running the code, Blocko will add your log to the queue, and sends all logs to the API to be processed into your analytics dashboard. You can change this refresh rate freely in the `Configuration.luau` file.

**Please note that you are limited to 100 requests per minute.**
