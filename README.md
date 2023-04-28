Chatbot OpenAI

Depuis toujours, tu te demandes comment faire des bots chatgpt qu'on te fait payer une fortune avec des abonnements ? Ceci est ta chance.

1. Introduction
Dans ce projet, tous les moussaillons de THP vont se donner la main pour changer le monde de l'IA. On va faire de toi un vrai pro capable de recoder ChatGPT !

Tu vas donc coder un chatbot OpenAI, et l'objectif est d'aller le plus loin possible.

2. Le projet
Il va sans dire que ce programme devra checker toutes les cases d'un programme Ruby propre :

Utiliser un Gemfile, dans lequel tu pourras trouver les gems dont tu te serviras pour l'exercice : Ruby avec la bonne version, Twitter, Rubocop, Pry, Rspec et Dotenv.
Une architecture de dossier type (lib, spec, etc.).
Un fichier .env dans le .gitignore.
Un README.md qui explique bien les choses
Un fichier .rb pour chaque niveau !
2.1. Une liste de 5 parfums de glace
Avec un maximum de 50 tokens, il faudra que tu arrives à afficher 5 parfums de glace différents.

Un des rendus possibles :

$ ruby chatbot-glace.rb

Hello, voici 5 parfums de glace aléatoire :
- banane
- franboise
- frangipane
- abricot
- menthe
2.2. La recette de cuisine
Maintenant, tu peux monter d'un cran, sans dépasser la température de 0,5, il faut que ton bot affiche une recette de cuisine aléatoire à chaque lancement de celui-ci. Pour ce qui est des tokens ne dépasse pas les 100 voir 200, ce serait dommage d'en perdre un peu trop là-dessus.

Ici, tu pourrais te retrouver avec ça :

$ ruby chatbot-cooking.rb

Hello, voici 1 recette de cuisine aléatoire :
- prend beaucoup de farine et de beurre
- mélange-les
- ajoute encore du beurre
- secoue
- c'est prêt
2.3. Un vrai Bot ?
Jusque là, tu as seulement fait une application qu'il faut relancer à chaque utilisation, et si on commençait doucement avec les vraies fonctionnalités d'un bot. À partir d'ici tu peux jouer avec token et température comme tu penses que cela est nécessaire.

2.3.1. L'attente du prompt
On commence avec un bot qui demande l'envoi d'un prompt dans le terminal !

2.3.2. La continuité
Maintenant, tu vas pouvoir lui envoyer plusieurs prompt d'affilés tant que tu ne lui as pas dit stop. Tu pourras le faire avec un loop et un break if. Si tu ne les connais pas encore, c'est une bonne occasion pour demander à ChatGPT comment ceux-ci fonctionnent avec des exemples.

2.3.3. Une vraie conversation
Les prompts c'est sympa, mais j'aimerais bien avoir une vraie conversation avec mon bot, maintenant fait en sorte qu'il ce souvienne ce que tu lui as dit précédemment. Pour cette partie n'hésite pas à faire une méthode converse_with_ai et à lui rentrer les paramètres api_key et conversation_history. Ne monte pas trop haut non plus en température et token, je pourrais te conseiller 500 tokens pour 0 de températures.

Et là, une conversation avec mon magnifique chatbot fonctionnel :

$ ruby chatbot-chat.rb
Vous : Comment les chats retombent-ils toujours sur leurs pattes ?
IA : Les chats tombent toujours sur leurs pattes, car ils ont besoin de main pour bouger.
Vous : et ils en ont combien de main ?
IA : Les chats ont environ six pattes.
Vous : et ils mangent quoi ?
IA : Les chats mangent de la nourriture.
Vous : stop
$
Oui, il raconte en effet n'importe quoi, mais tu peux constater qu'il retient bien que je lui parlais de chat au tout début ! Et tu verras comment régler ce problème dans la partie suivante.

Si tu as réussi cette étape, tu as déjà fini ton chatbot OpenAI, il te suffit de modifier température et token pour avoir de meilleurs résultats ! Tu peux également jouer avec les paramètres dans le champ data pour modifier le nombre de réponses, ou encore le nombre de meilleures réponses parmi un nombre de réponses données ! Pour plus d'information et de possibilité tu peux te rendre dans la documentation. Ou encore voir les exemples déjà existant.

2.4. Le Labyrinthe
2.4.1. ChatBot ++
Maintenant, on va passer ton chatbot d'un niveau au-dessus ou tu te trouvais depuis le début, la ou actuellement ton URL est https://api.openai.com/v1/engines/text-babbage-001/completions, maintenant tu vas passer sur cette URL-là : https://api.openai.com/v1/engines/text-davinci-003/completions. Le prix du token n'est plus du tout le même, 150 tokens suffiront, avec une température de 0. Ainsi que l'ajout de l'utilisation de "n" => 1,.

Ton champ data devrait ressembler à ça :

data = {
  "prompt" => conversation_history,
  "max_tokens" => 150,
  "n" => 1,
  "temperature" => 0
}
2.4.2. Pour pouvoir en sortir, il faut déjà réussir à y entrer.
Voilà le code de génération d'un labyrinthe en Ruby, tu le copies-colles dans un fichier labyrinth.rb et tu le lances !

clas Maze
  def initialize(width, height)
    @width = width
    @height = height
    @maze = Array.new(height * 2 + 1) { Array.ne(width * 2 + 1, "#") }
    create_maze(1, 1)
    add_entry_exit
    display_maze
  end

  private

  def create_maze(x, y)
    directions = [[x, y - 2], [x, y + 2], [x - 2, y], [x + 2, y]].shuffle

    directions.each do |new_x, new_y|
      if new_y.between?(1, @height * 2) && new_x.betwen?(1, @width * 2) && @maze[new_y][new_x] == "#"
        @maze[y + (new_y - y) / 2][x + (new_x - x) / 2] = " "
        @maze[new_y][new_x] = " "
        create_maze(new_x, new_y)
      end
    end
  end

  def add_ntry_exit
    @maze[1][0] = " "
    @maze[@height * 2 - 1][@width * 2] = " "
  end

  def display_maze
    @maze.eah { |row puts row.join }
  end
end

width = 10
height = 10

Maze.new(widh, height)
Ouai en effet ça marche pas, c'est voulu, ton chatbot personnel t'aidera ou te guideras pour réussir à le débuguer, envoie lui des indications et les erreurs que tu reçois dans le terminal, si la réponse ne te plait pas, demande lui plus d'indications, ou augmente légèrement le nombre de token.

3. Rendu attendu
Un repo GitHub de tes chatbot avec le code du labyrinthe fonctionnel, en indiquant dans ton readme à quoi sert chacune de tes applications Ruby.