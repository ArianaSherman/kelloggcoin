# Cryptocurrency is all the rage. You have decided to create your own,
# KelloggCoin, that will massively disrupt financial markets at the Global
# Hub.

# Don't change the following code, which represents a series of transactions, each
# of which represents a transfer of KelloggCoin from one user to another – transactions 
# with no from_user are from the "ICO" (Initial Coin Offering)

blockchain = [
  { "from_user" => nil, "to_user" => "ben", "amount" => 20000 },
  { "from_user" => nil, "to_user" => "brian", "amount" => 20000 },
  { "from_user" => "ben", "to_user" => "evan", "amount" => 9000 },
  { "from_user" => "brian", "to_user" => "anthony", "amount" => 7000 },
  { "from_user" => "evan", "to_user" => "anthony", "amount" => 400 },
  { "from_user" => "ben", "to_user" => "anthony", "amount" => 1500 },
  { "from_user" => "anthony", "to_user" => "ben", "amount" => 4500 },
  { "from_user" => "anthony", "to_user" => "evan", "amount" => 1750 }
]

# Write code below that returns the number of KelloggCoin that each user has in their 
# KelloggCoin "wallet".

# It should print out:
# Ben's KelloggCoin balance is 14000
# Brian's KelloggCoin balance is 13000
# Evan's KelloggCoin balance is 10350
# Anthony's KelloggCoin balance is 2650

# 👇👇👇 Your code HERE 👇👇👇
index=0
totals=[]
loop do
  if index==blockchain.size
    break
  end
  index2=0
  found=false
  index3=0
  found2=false
  loop do #add funds to user 
    if index3==totals.size 
      break
    end
    if totals[index3]["User"]==blockchain[index]["to_user"]
      totals[index3]["Total"]=totals[index3]["Total"]+blockchain[index]["amount"]
      found2=true
      break 
    end
    index3=index3+1
  end
  if !found2
    totals<<{"User"=>"#{blockchain[index]["to_user"]}","Total"=>blockchain[index]["amount"]}
  end
  loop do #Remove funds from user
    if index2==totals.size 
      break
    end
    if totals[index2]["User"]==blockchain[index]["from_user"]
      totals[index2]["Total"]=totals[index2]["Total"]-blockchain[index]["amount"]
      found=true
      break 
    end
    index2=index2+1
  end
  if !found
    puts "#{blockchain[index]["from_user"]} Cannot remove funds, No Balance" #should break out of entire line here, but this won't happen in our blockchain example. will only hit with nil user  
  end
  index=index+1
end
index4=0
loop do #print totals 
  if index4==totals.size 
    break
  end
  puts "#{totals[index4]["User"].capitalize}'s KelloggCoin Balance is #{totals[index4]["Total"]}"
  index4=index4+1
end

