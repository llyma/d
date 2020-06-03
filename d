from time import*
from math import*
import discord

TOKEN = 'NzE3Nzk5MDQ1OTI5ODk0MDM4.Xtfkkw.pIPM3_da1lyUKjb83izRK4rZcko'

client = discord.Client()
times = time()
debt = 4025000 * pow(e,0.016 * (int(time()-1591025536))/ 86400)

rate = 0

@client.event

async def on_message(message):
    global times
    global debt
    global rate
    global div
    # we do not want the bot to reply to itself
    if message.author == client.user:
        return

    if message.content.startswith('d') or message.content.startswith('D'):
      if abs(times - time()) > 10:
        div = (time() - times)
        times = time()
        
        rate = (4025000 * pow(e,0.016 * (int(time()-1591025536))/ 86400) - debt) / div
        debt = 4025000 * pow(e,0.016 * (int(time()-1591025536))/ 86400)
        msg2 = "Owed to General6rievous: " + "{:,} ".format(int(debt)) 
        msg = 'Hello {0.author.mention}'.format(message)
        
        await message.channel.send(msg2 + " <@!574342124481282085> ")
        await message.channel.send("$ Increase per second: " + str(rate))
        await message.channel.send("$ Increase since last call: " + str(rate*div))
      

      else:
        await message.channel.send("The bot is on cooldown for " + str(int(times - time() + 11)) + " seconds")
    if message.content.startswith('future debt') and time()-times > 10:
      await message.channel.send("1 day: " + "{:,} ".format(4025000 * pow(e,0.016 * (int(time()-1590939136))/ 86400)) +  " <@!574342124481282085> ")
      await message.channel.send("1 week: " + "{:,} ".format(4025000 * pow(e,0.016 * (int(time()-1590420736))/ 86400)))
@client.event
async def on_ready():
    print('Logged in as')
    print(client.user.name)
    print(client.user.id)
    print('------')




client.run(TOKEN)

