
<p align=center>
    <svg width="85" height="85" viewBox="0 0 150 150" fill="none" xmlns="http://www.w3.org/2000/svg">
    <rect x="37" y="40.4667" width="61.6667" height="61.6667" rx="5" fill="#D9D9D9"/>
    <rect x="44.4" y="94.7333" width="12.3333" height="17.2667" rx="6.16667" fill="#D9D9D9"/>
    <rect x="78.9333" y="94.7333" width="12.3333" height="17.2667" rx="6.16667" fill="#D9D9D9"/>
    <rect x="46.8666" y="65.1333" width="12.3333" height="4.93333" rx="2.46667" fill="black"/>
    <rect x="78.9333" y="52.8" width="12.3333" height="17.2667" rx="6.16667" fill="black"/>
    <rect x="111.104" y="38" width="2.46667" height="14.8" transform="rotate(42.3516 111.104 38)" fill="white"/>
    <rect x="102.404" y="38.969" width="2.46667" height="8.16039" transform="rotate(27.2585 102.404 38.969)" fill="white"/>
    <rect x="112.77" y="47.4353" width="2.46667" height="10.2577" transform="rotate(63.3787 112.77 47.4353)" fill="white"/>
</svg>

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
