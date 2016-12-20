# coding=utf-8
import nltk
import sys, os

sample = """
Stuffing
1 tablespoon olive oil
2 cups butternut squash, diced
1 teaspoon salt
3 garlic cloves, minced
1 pound ground turkey
2 teaspoons Italian seasoning
1 teaspoon red pepper flakes
1 teaspoon black pepper
2 cups spinach
1 teaspoon salt
15 ounces ricotta cheese
1 egg
¼ cup parmesan cheese
Salt, to taste
Pepper, to taste

Sauce
2 tablespoons butter
2 tablespoons flour
1 cup milk
Salt, a pinch
Pepper, a pinch

PREPARATION
Heat olive oil in a large pan.
Add the butternut squash and salt, and sauté for a few minutes. Then add garlic, turkey, Italian seasoning, pepper flakes, and black pepper, and stir until meat is fully cooked.
Add in spinach and salt until the spinach is wilted.
In a large bowl, add ricotta, egg, cheese, and a pinch of salt and pepper. Mix well.
Add the cooked squash mixture into the bowl. Mix until evenly blended.
Cook a box of jumbo shell pasta al dente. Set aside in a bowl covered in olive oil to prevent sticking.
Heat butter in a medium pan. Once melted, add in flour.
Cook the flour until it turns light brown.
Add milk to the pan and stir continuously until the sauce thickens.
Add a pinch of salt and pepper.
In a casserole dish, sheet the sauce on the bottom.
Stuff each jumbo shell pasta with the stuffing and place on top of the sauce.
Bake at 400°F/ 200°C covered for 30 minutes.
Sprinkle parmesan cheese and bake again for 5 minutes until the cheese melts.
Garnish with parsley and enjoy!
"""
from difflib import SequenceMatcher

def similar(a, b):
    return SequenceMatcher(None, a, b).ratio()

inp = []
for line in sys.stdin:
    sys.stdout.write(line)
    inp.append(line)

if len(inp) > 0:
    sample = "\n".join(inp)

tagged = nltk.pos_tag(nltk.word_tokenize(sample.lower()))

description_words = [i[0] for i in tagged if i[1] == 'NN']

# Tagged words for examination -- Output
print(description_words)

# btframes_path = "/Users/dsiah/Documents/SeniorProject/tasty_videos/frames/betterframes/"
#
# text_files = [f for f in os.listdir(btframes_path) if f.endswith('.txt')]
# for file in text_files:
#     with open(btframes_path + file, 'r') as myfile:
#         data = myfile.read()
#         guesses = nltk.pos_tag(nltk.word_tokenize(data))
#         skimmed_guesses = [i[0] for i in guesses if i[1] == 'NN']
#         score = 0
#         for guess in skimmed_guesses:
#             print(guess)
#             if guess in description_words:
#                 score += 1
#             else:
#                 for tag_word in description_words:
#                     if (similar(tag_word, guess) > 0.8):
#                         score += 1
#                         break
#         print(str(score) + " " + str(len(skimmed_guesses)))
# print(text_files)

Venugopalan, Subhashini and Rohrbach, Marcus and Donahue, Jeff and Mooney, Raymond and Darrell, Trevor and Saenko, Kate
"Sequence to Sequence -- Video to Text". Proceedings of the IEEE International Conference on Computer Vision (ICCV), 2015
