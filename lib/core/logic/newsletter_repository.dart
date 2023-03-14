import 'package:sollet/models/newsletter.dart';

class NewsletterRepository {
  final List<Newsletter> _newsletterList = [
    Newsletter(
      "decentralized-digest",
      "Decentralized Digest",
      "Weekly newsletter on blockchain, cryptocurrencies, and DeFi. Curated news, analysis, and expert opinions.",
      "https://example.com/decentralized-digest.png",
      ["#Blockchain", "#Crypto", "#DeFi"],
    ),
    Newsletter(
      "token-tribune",
      "Token Tribune",
      "Monthly newsletter on tokenization, including security and utility tokens, and NFTs. Insights into trends and investment opportunities.",
      "https://example.com/token-tribune.png",
      ["#Tokenization", "#SecurityTokens", "#NFTs"],
    ),
    Newsletter(
      "crypto-currents",
      "Crypto Currents",
      "Bi-weekly newsletter on cryptocurrencies. Market analysis, regulatory updates, and emerging use cases.",
      "https://example.com/crypto-currents.png",
      ["#Crypto", "#Bitcoin", "#Ethereum"],
    ),
    Newsletter(
      "blockchain-bulletin",
      "Blockchain Bulletin",
      "Monthly newsletter on blockchain use cases across industries. Analysis of latest projects, interviews, and insights.",
      "https://example.com/blockchain-bulletin.png",
      ["#Blockchain", "#DApps", "#SmartContracts"],
    ),
    Newsletter(
      "digital-frontier",
      "The Digital Frontier",
      "Weekly newsletter on emerging technologies. AI, ML, blockchain, and IoT insights into their impact on industries.",
      "https://example.com/the-digital-frontier.png",
      ["#AI", "#ML", "#IoT"],
    ),
    Newsletter(
      "web3-watch",
      "Web3 Watch",
      "Monthly newsletter covering the latest trends and developments in the Web3 ecosystem. Expert insights and analysis on blockchain, decentralized finance, and NFTs.",
      "https://example.com/web3-watch.png",
      ["#Web3", "#DeFi", "#NFTs"],
    ),
    Newsletter(
      "smart-contract-digest",
      "Smart Contract Digest",
      "Weekly newsletter on smart contracts, focusing on their development and deployment. Coverage of the latest trends, tools, and applications.",
      "https://example.com/smart-contract-digest.png",
      ["#SmartContracts", "#Ethereum", "#Blockchain"],
    ),
    Newsletter(
      "crypto-investor-digest",
      "Crypto Investor Digest",
      "Monthly newsletter for cryptocurrency investors. Market analysis, investment strategies, and insights from top industry experts.",
      "https://example.com/crypto-investor-digest.png",
      ["#Crypto", "#Investing", "#Bitcoin"],
    ),
    Newsletter(
      "nft-now",
      "NFT Now",
      "Bi-weekly newsletter on the latest developments in the NFT space. Coverage of new projects, trends, and emerging use cases.",
      "https://example.com/nft-now.png",
      ["#NFTs", "#Art", "#Collectibles"],
    ),
    Newsletter(
      "blockchain-insights",
      "Blockchain Insights",
      "Weekly newsletter on blockchain and distributed ledger technology. In-depth analysis of the latest trends, projects, and use cases.",
      "https://example.com/blockchain-insights.png",
      ["#Blockchain", "#DLT", "#Decentralization"],
    ),
  ];

  Future<List<Newsletter>> get newsletters async {
    return _newsletterList;
  }

  Newsletter findByShortName(String shortName) {
    return _newsletterList
        .firstWhere((element) => element.shortName == shortName);
  }
}
