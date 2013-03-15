//
//  AppDelegate.m
//  Demo
//
//  Created by Nikhil Tammewar on 14/03/13.
//  Copyright (c) 2013 Nikhil Tammewar. All rights reserved.
//

#import "AppDelegate.h"
#import "NotificationQuotes.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_managedObjectContext release];
    [_managedObjectModel release];
    [_persistentStoreCoordinator release];
    [super dealloc];
}

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    NSArray* arr = [[NSArray alloc] initWithObjects: @"Vision is the art of seeing \nthe invisible",
    @"We make a living by what we get, but we make a life by what we give\nNorman MacEwan",
    @"The world is full of beauty when your heart is filled\nwith love.",
    @"The quality of a person’s life is in direct proportion to their commitment to excellence, regardless of their chosen field of endeavor. \nVincent T Lombardi",
    @"It is a funny thing about life; if you refuse to accept anything but the best, you very often get.\nSomerset Maugham",
    @"Small opportunities are often the beginning of great enterprises. \nDemosthenes",
    @"All things are difficult before they are easy. \nJohn Norley",
    @"Opportunities are disguised by hard work, so most people don't recognise them.",
    @"Faith is trusting in the good. \nFear is putting your trust in the bad.",
    @"The best executive is the one who has sense enough to pick good people to do what he needs to be done, and self-restraint enough to keep from meddling with them while they do it.",
    @"Adveristy reveals genius, prosperity conseals it.",
    @"The quality of a person’s life is in direct proportion to their commitment to excellence, regardless of their chosen field of endeavour. \n Vincent T. Lombardi",
    @"All things are difficult before they are easy. \nJohn Norley",
    @"The speed of the leader determines the rate of \nthe pack.",
    @"Small opportunities are often the beginning of great enterprises. \nDemosthenes",
    @"Our chief want in life is somebody who will make us do what we can. \nRalph Waldo Emerson",
    @"Happiness lies in the joy of achievement and the thrill of creative effort. \nFranklin Roosevelt",
    @"People forget how fast you did a job - but they remember how well you did it. \nHoward W. Newton",
    @"The price of greatness is responsibility. \nWinston Churchill",
    @"There is one thing stronger than all the armies in the world and that is an idea whose time has come. \nVictor Hugo",
    @"The reward of a thing well done is to have done it. \nRalph Waldo Emerson",
    @"Remember, no one can make you feel inferior without your consent. \nEleanor Roosevelt",
    @"Accept the challenges so that you may feel the exhilaration of victory. \nGeneral George S. Patton",
    @"The future belongs to those who believe in the beauty of their dreams. \nEleanor Roosevelt",
    @"Destiny is not a matter of chance, it is a matter of choice.”",
    @"There is something that is much more scarce, something rarer than ability. It is the ability to recognize ability\nRobert Half",
    @"The highest reward for a person’s toil is not what they get for it, but what they become by it. \nJohn Ruskin",
    @"Do not follow where the path may lead. Go instead where there is no path and leave a trail.",
    @"Success is simply a matter of luck. Ask any failure.",
    @"The difference between ordinary and extraordinary is that little extra.",
    @"Genius is one percent inspiration and ninety-nine percent perspiration. \nThomas Alva Edison",
    @"Progress always involves risk; you can’t steal second base and keep your foot on first. \nFrederick Wilcox",
    @"Luck is what happens when preparation meets opportunity. \nElmer Letterman",
    @"Think wrongly, if you please, but in all cases think for yourself. \nDoris Leasing",
    @"The people who get on in this world are the people who get up and look for the circumstances they want, and if they can’t find them, make them. \nGeorge Bernard Shaw",
    @"I don’t know what your destiny will be, but on thing I know; the only ones among you who will be really happy are those who will have sought and found how to serve. \nDr. Albert Schweitzer",
    @"Do not wish to be anything but what you are, and try to be that perfectly. \nSt. Francis De Sales",
    @"Many receive advice, \nonly the wise profit from it. \nSyrus",
    @"Far away there in the sunshine are my highest aspirations. I may not reach them, but I can look up and see their beauty, believe in them and try to follow where they lead. \nLouisa May Alcott",
    @"Chance favors the prepared mind. \nLouis Pasteur",
    @"Failures are divided into two classes - those who thought and never did, and those who did and never thought. \nJohn Charles Salak",
    @"Doubt whom you will, but never yourself.",
    @"When you hire people who are smarter than you are, you prove you are smarter than they are. \nR. H. Grant",
    @"Dont compromise yourself. You are all you’ve got. \nBetty Ford",
    @"When we have done our best, we should wait the result",
    @"in peace. \nJ. Lubbock",
    @"Obstacles are those frightful things you see when you take your eyes off your goals.",
    @"I have learned from experience that the greater part of our happiness or misery depends on our dispositions and not on our circumstances. \nMartha Washington",
    @"When two people in a business always agree, one of them is unnecessary.",
    @"Genius is the ability to reduce the complicated to the simple. \nC. W. Ceran",
    @"You will become as small as your controlling desire; as great as your dominant aspiration. \nJames Allen",
    @"Make no little plans; they have no magic to stir men’s blood and probably themselves will not be realized. Make big plans; aim high in hope and work, remembering that a noble, logical diagram once recorded will not die.",
    @"Daniel H. Burnham",
    @"To succeed is nothing - it’s an accident. But to feel no doubts about oneself is something very different: it is character.\nMarie LenÇru",
    @"Dont wait for your ship to come in, swim out to it.",
    @"Things may come to those who wait, but only the things left by those who hustle.",
    @"Abraham Lincoln",
    @"Getting something done is an accomplishment; getting something done right is an achievement.",
    @"There’s no thrill in easy sailing when skies are clear and blue, there’s no joy in merely doing things which any one can do. But there is some satisfaction that is mighty sweet to take, when you reach a destination that you thought you’d never make. \nSpirella",
    @"To love what you do and feel that it matters - how could anything be more fun? \nKatharine Graham",
    @"We are continually faced by great opportunities brilliantly disguised as insoluble problems.",
    @"A great pleasure in life is doing what people say you cannot do. \nWalter Gagehot",
    @"Winners expect to win in advance. Life is a self-fulfilling prophecy.",
    @"Winning is not a sometime thing; it’s an all time thing. You don’t win once in a while, you don’t do things right once in a while, you do them right all the time. Wining is a habit. Unfortunately, so is losing. \nVincent Lombardi",
    @"In great attempts it is glorious even to fail. \nJacob Riis",
    @"For fast-acting relief try slowing down. \nLily Tomlin",
    @"Vision is the art of seeing the invisible. \nJonathan Swift",
    @"Yesterday is a canceled check; tomorrow is a promissory note; today is the only cash you have - so spend it wisely. \nKay Lyons",
    @"The secret of happiness is not doing what one likes, but in liking what one does. \nJames M. Barrie",
    @"I don’t know that there are any short cuts to doing a good job.",
    @"The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather in a lack of will. \nVincent T. Lombardi",
    @"Desire is the key to motivation, but it’s the determination and commitment to the unrelenting pursuit of your goal - a commitment to excellence - that will enable you to attain the success you seek. \nMario Andretti",
    @"Success is a journey not a destination. \nBen Sweetland",
    @"He who believes is strong; he who doubts is weak. Strong convictions precede great actions. \nJ. F. Clarke",
    @"If better is possible, good is not enough.",
    @"Every job is a self-portrait of the person who did it. Autograph your work with excellence.",
    @"You can only make others better by being good yourself.",
    @"The difference between failure and success is doing a thing nearly right and doing a thing exactly right. \nEdward Simmons",
    @"Well done is better than well said. \nBen Franklin",
    @"Many of life’s failures are people who did not realize how close they were to success when they gave up.",
    @"We are what we repeatedly do. Excellence, then, is not an act but a habit.",
    @"Some people dream of worthy accomplishments while others stay awake and do them.",
    @"I am a big believer in the ‘mirror test’. All that matters is if you can look in the mirror and honestly tell the person you see there, that you’ve done your best. \nJohn McKey - NFL Coach",
    @"Unless you try to do something beyond what you have already mastered, you will never grow. \nRalph Waldo Emerson",
    @"To dream anything that you want to dream. That is the beauty of the human mind. To do anything that you want to do. That is the strength of the human will. To trust yourself to test your limits. That is the courage to succeed. \nBernard Edmonds- American Writer",
    @"To live is so startling it leaves little time for anything else. \nEmily Dickinson",
    @"The ultimate victory in competition is derived from the inner satisfaction of knowing that you have done your best and that you have gotten the most out of what you had to give. \nHowerd Cosell - Sports Broadcaster",
    @"All glory comes from daring to begin. \nEugene F. Ware - American Lawyer/Poet",
    @"The worst bankrupt in the world is the person who has lost his enthusiasm.\nH. W. Arnold",
    @"The price of success is hard work, dedication to the job at hand and the determination that whatever we win or lose, we have applied the best of ourselves to the task at hand. \nVince Lombardi - NFL Coach",
    @"It’s what you learn after you know it all that counts. \nJohn Wooden",
    @"Only those who dare to fail greatly can ever achieve greatly.",
    @"The greatest thing in this world is not so much where we are, but in what direction we are moving. \nO. W. Holmes",
    @"The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather in a lack of will. \nVince Lombardi",
    @"You may not have been responsible for your heritage, but you are responsible for your future.",
    @"No one ever attains very eminent success by simply doing what is required of him; it is the amount and excellence of what is over and above the required that determines the greatness of ultimate distinction. \nCharles Kendall Adams",
    @"A total commitment is paramount to reaching the ultimate in performance. \nTom Flores - NFL Coach",
    @"Always view problems as opportunities in work clothes.",
    @"Never, Never, Never Quit. \nWinston Churchill",
    @"Love is never afraid of giving too much.",
    @"When an archer misses the mark, he turns and looks for the fault within himself. Failure to hit the bull’s-eye is never the fault of the target. To improve your aim - improve yourself. \nGirbert Arland",
    @"If you don’t invest very much, then defeat doesn’t hurt very much and winning is not very exciting. \nDick Vermeil",
    @"Never turn down a job because you think it’s too small, you don’t know where it can lead. \nJulia Morgan",
    @"Good is not good where better is expected. \nThomas Fuller",
    @"Choice, not chance, determines destiny.",
    @"One of life’s most painful moments comes when we must admit that we didn’t do our homework, that we are not prepared. \nMerlin Olsen",
    @"The road to success is paved with good intentions.",
    @"Winning isn’t everything – it’s the only thing. \nVince Lombardi",
    @"Plan your work for today and every day, then work your plan. \nNorman Vincent Peale",
    @"If you’ve made up your mind you can do something you’re absolutely right.",
    @"For every failure, there’s an alternative course of action. You just have to find it. When you come to a roadblock, take a detour. \nMary Kay Ash",
    @"To succeed - do the best you can, where you are, with what you have.",
    @"Do not let what you cannot do interfere with what you can do. \nJohn Wooden",
    @"Ingenuity, plus courage, plus work, equals miracles. \nBob Richards",
    @"A good goal is like a strenuous exercise - it makes you stretch. \nMary Kay Ash",
    @"The only time you can’t afford to fail is the last time you try. \nCharles Kettering",
    @"Don’t measure yourself by what you have accomplished, but by what you should have accomplished with your ability.",
    @"Real leaders are ordinary people with extraordinary determination.",
    @"Hope sees the invisible, feels the intangible and achieves the impossible.",
    @"Failure is not the worst thing in the world. The very worst is not to try.",
    @"Enthusiasm is the propelling force necessary for climbing the ladder of success.",
    @"Great minds must be ready not only to take opportunities, but to make them. \nColton",
    @"The harder you work the luckier you get.",
    @"We cannot direct the wind... But we can adjust the sails.",
    @"Great minds must be ready not only to take opportunities, but to make them. \nColton",
    @"Act as though it were impossible to fail.",
    @"Don’t be afraid to take a big step if one is indicated. You can’t cross a chasm in two small jumps. \n David Lloyd George",
    @"There are four steps to accomplishment: Plan Purposefully. Prepare Prayerfully. Proceed Positively. Pursue Persistently.",
    @"Believe only half of what you see and nothing that you hear. \nDinah Mulock Craik",
    @"There is always room at the top. \nDaniel Webster",
    @"The spirit, the will to win, and the will to excel are things that endure. These qualities are so much more important than the events that occur. \nVince Lombardi",
    @"Praise, like gold and diamonds, owes its value to its scarcity.",
    @"It takes courage to push yourself to places that you have never been before... to test your limits... to break through barriers.",
    @"People seldom improve when they have no other model but themselves to copy after. \nGoldsmith",
    @"The mind is the limit. As long as the mind can envision the fact that you can do something, you can do it - as long as you really believe 100 percent. \nArnold Schwarzenegger",
    @"These, then, are my last words to you: Be not afraid of life. Believe that life is worth living and your belief will help create the fact. \nWilliam James",
    @"Mistakes are a fact of life, It is the response to error that counts. \nNikki Giovanni",
    @"Wisdom is knowing what to do next, skill is knowing how to do it, and virtue is doing it. \nDavid Starr Jordan",
    @"The only limit to our realization of tomorrow will be our doubts of today. \nFranklin D. Roosevelt",
    @"Life is my college. \nLouisa May Alcott",
    @"Paralyze resistance with persistance.",
    @"Take each day and relish each moment. Take each bad day and work to make it good. \nLisa Dado",
    @"Courage is doing what you’re afraid to do. There can be no courage unless you’re scared.\nEddie Rickenbacher",
    @"All the significant battles are waged within the self. \nSheldon Kopp",
    @"I have great belief in the fact that wherever there is chaos, it creates wonderful things. I consider chaos a gift. \nSeptima Poinsette Clark",
    @"The scars you acquire by exercising courage will never make you feel inferior. \nD. A. Battista",
    @"Success is never final, and failure is never fatal; it’s courage that counts.",
    @"There’s only one real sin and that is to persuade oneself that second-best is anything but second-best.Doris Leesing",
    @"Whoever said, ‘It’s not whether you win or lose that counts,”probably lost. \nMartina Navratilova",
    @"He who loses wealth loses much; he who loses a friend loses more; but he that loses courage loses all. \nCervantes",
    @"Nothing strengthens the judgement and quickens the conscience like individual responsibility. \nElizabeth Cady Stanton",
    @"The surest way to go broke is to sit around waiting for a break.",
    @"You have a remarkable ability which you never acknowledged before. It is to look at a situation and know whether you can do it. And I mean really know the answer... \nCarl Frederick",
    @"In order to succeed, we must first believe that we can. \nMichael Korda",
    @"Be grateful for luck, but don’t depend on it.",
    @"The first and most important step toward success is the feeling that we can succeed. \nNelson Boswell",
    @"In the moment that you carry this conviction... in that moment your dreams will become a reality. \nRobert Collier",
    @"Always remember that your own resolution to succeed is more important than any thing else. \nAbraham Lincoln",
    @"The strongest single factor in prosperity consciousness is self-esteem: believing you can do it, believing you deserve it, believing you will get it. \nJerry Gillies",
    @"Whether you think you can or think you can’t - you are right. \nHenry Ford",
    @"Success is the maximum utilization of the ability that you have. \nZig Ziglar",
    @"There is an infinite difference between a little wrong and just right, between fairly good and the best, between mediocrity and superiority... \nOrison Swett Marden",
    @"The one thing that doesn’t abide majority rule is a person’s conscience. \nHarper Lee",
    @"Courage is resistance to fear, mastery of fear - not absence of fear. \nMark Twain",
    @"Success has always been easy to measure.",
    @"It is the distance between one’s origins and one’s final achievement. \nMichael Korda",
    @"You learn that, whatever you are doing in life, obstacles don’t matter very much. Pain or other circumstances can be there but if you want to do a job bad enough, you’ll find a way to get it done. \nJack Youngblood",
    @"Nothing splendid has ever been achieved by those who dared believe that something inside of them was superior to circumstance. \nBruce Barton",
    @"Expect trouble as an inevitable part of life and repeat to yourself the most comforting words of all: “This, too, shall pass” \nAnn Landers",
    @"Desire creates the power. \nRaymond Holliwell",
    @"Little minds attain and are subdued by misfortunes; but great minds rise above them. \nWashington Irving",
    @"Stone walls do not a prison make, nor iron bars a cage. \nRichard Lovelace",
    @"As long as you keep a person down, some part of you has to be down there to hold him down, so it means you cannot soar as you otherwise might. \nMarian Anderson",
    @"True courage is a result of reasoning. A brave mind is always impregnable. \ Jeremy Collier",
    @"You cannot shake hands with a clenched fist. \nGolda Meir",
    @"If you only care enough for a result, you will almost certainly attain it. \nWilliam Jameson",
    @"Courage is the capacity to confront what can be imagined. \nLeo Rosten",
    @"Obstacles will look large or small to you according to whether you are large or small. \nOrison Swett Marden",
    @"Nothing is impossible to a willing heart. \nJohn Heywood",
    @"A strong passion for any object will ensure success, for the desire of the end will point out the means. \nWilliam Hazlitt",
    @"For the resoulte and determined there is time and opportunity. \nRalph Waldo Emerson",
    @"I do the very best I know how - the very best I can; and I mean to keep on doing so until the end. \nAbraham Lincoln",
    @"It sometimes seems that intense desire creates not only its own opportunities but its own talents. \nEric Hoffer",
    @"All our dreams can come true - if we have the courage to pursue them. \nWalt Disney",
    @"You can’t invent events. They just happen. But you have to be prepared to deal with them when they happen. \nMartha Washington",
    @"The intensity of your desire governs the power with which the force is directed. \nJohn McDonald",
    @"The starting point of all achievement is desire. Keep this consistantly in mind. Weak desires bring weak results, just as a small amount of fire makes a small amount of heat. \nNapoleon Hill",
    @"To be what we are, and to become what we are capable of becoming, is the only end of life. \nRobert Louis Stevenson",
    @"A will finds a way. \nOrisin Swett Marden",
    @"Remember you will not always win. Some days, the most resourceful individual will taste defeat. But there is, in this case, always tomorrow - after you have done your best to achieve success today. \nMaxwell Maltz",
    @"No man ever achieved worthwhile success who did not, at one time or another, find himself with at least on foot hanging well over the brink of failure. \nNapoleon Hill",
    @"There is no right way to do the wrong thing.",
    @"The greatest mistake a man can make is to be afraid of making one. \nElbert Hubbard",
    @"Excellence is to do a common thing in an uncommon way. \nBooker T. Washington",
    @"I have learned that success is to be measured not so much by the position that one has reached in life as by the obstacles which one has overcome while trying to succeed. \nBooker T. Washington",
    @"We must use time creatively and forever realize that time is always hope to do great things.",
    @"The successful man will make profit from his mistakes and try again in a different way.",
    @"Don’t be afraid to fail. Don’t waste energy trying to cover up failure. Learn from your failures and go on to the next challenge. It’s OK. If you’re not failing, you’re not growing.\nH. Stanley Judd",
    @"A man without a purpose is like a ship without a rudder. \nThomas Carlyle",
    @"It is better to deserve honors and not have them than to have them and not deserve them. \nMark Twain",
    @"Failure is success if we learn from it. \nMalcolm S. Forbes",
    @"The most important thing about goals is having one. \nGeoffrey F. Abert",
    @"Honesty is the first chapter of the book of wisdom. \nThomas Jefferson",
    @"The difference between greatness and mediocrity is often how an individual views a mistake. \nNelson Boswell",
    @"Success doesn’t come to you.... you go to it. \nMavra Collins",
    @"Prefer a loss to a dishonest gain; the one brings pain at the moment the other for all time. \nChilon",
    @"If a man knows not what harbor he seeks, any wind is the right wind. \nSeneca",
    @"There is no achievement without goals. \nRobert J. McKain",
    @"If you don’t know where you are going, how can you expect to get there? \nBasil S. Walsh",
    @"He can who thinks he can, and he can’t who thinks he can’t. This is an inexorable, indisputable law. \nOrison Swett Marden",
    @"In some attempts, it is glorious even to fail. \nLonginus",
    @"People with goals succeed because they know where they’re going. \nEarl Nightingale",
    @"The man who goes farthest is generally the one who is willing to do and dare. The sure-thing boat never gets far from shore. \nDale Carnegie",
    @"Until input (thought) is linked to a goal (purpose) there can be no intelligent accomplishment. \nPaul. G. Thomas",
    @"This one step - choosing a goal and sticking to it - changes everything. \nScott Reed",
    @"The kind of people I look for to fill top management spots are the eager beavers, the mavericks. These are the guys who try to do more than they’re expected to do - they always reach\nLee Lacocca",
    @"Ideas are funny little things. They won’t work unless you do.",
    @"Whatever our creed, we feel that no good deed can by any possibility go unrewarded, no evil deed unpunished. \nOrison Swett Marden",
    @"When a man feels throbbing within him the power to do what he undertakes as well as it can possibly be done, this is happiness. this is success. \nOrison Swett Marden",
    @"In seeking happiness for others, you find it for yourself.",
    @"Everyone will experience the consequences of his own acts. If his acts are right, he’ll get good consequences; if they’re not, he’ll suffer for it. \nHarry Browne",
    @"The indispensable first step to getting the things you want out of life is this: decide what you want. \nBen Stein",
    @"A race horse that can run a mile a few seconds faster is worth twice as much. That little extra proves to be the greatest value. \nJohn D. Hess",
    @"I contend that dishonesty will create a failure force that often manifests itself in other ways - ways not apparent to the outside observer. \nJoseph Sugarman",
    @"Success doesn’t come to you... you go to it. \nMarva Collins",
    @"What this power is I cannot say; all I know is that it exists and it becomes available only when a man is in that state of mind in which he knows exactly what he wants and is fully determined not to quit until he finds it. \nAlexander Graham Bell",
    @"Choose the way of life. Choose the way of love. Choose the way of caring. Choose the way of goodness. It’s up to you. It’s your choice. \nLeo Buscaglia",
    @"What I do today is important because I am paying a day of my life for it. What I accomplish must be worthwhile because the price is high.",
    @"Every situation, properly perceived, becomes an opportunity. \nHelen Schucman",
    @"You cannot do wrong without suffering wrong. \nRalph Waldo Emerson",
    @"Each time you are honest and conduct yourself with honesty, a success force will drive you toward greater success. Each time you lie, even with a little white lie, there are strong forces pushing you toward failure. \nJoseph Sugarman",
    @"The lure of the distant and the difficult is deceptive. The great opportunity is where you are.\nJohn Burroughs",
    @"The cure for all the ills and wrongs, the cares, the sorrows, and the crimes of humanity, all lie in the one word “love”. It is the divine vitality and everywhere produces and restores life. \nLydia Maria Child",
    @"What force is more potent than love. \nIgor Stravinsky",
    @"Most successful men have not achieved their distinction by having some new talent or opportunity presented to them. They have developed the opportunity that was at hand. \nBruce Barton",
    @"I do not think there is any other quality so essential to success of any kind as the quality of perseverance. It overcomes almost everything, even nature. \nJohn D. Rockerfeller",
    @"Love is the immortal flow of energy that nourishes, extends and preserves. Its eternal goal is life. \nSmiley Blanton",
    @"Opportunities? They are all around us... there is power lying latent everywhere waiting for the observant eye to discover it. \nOrison Swett Marden",
    @"The golden opportunity you are seeking is in yourself. It is not in your environment; it is not in luck or chance, or the help of others; it is in yourself alone. \nOrison Swett Marden",
    @"Life in abundance comes only through great love. \nElbert Hubbard",
    @"Problems are only opportunities in work clothes.",
    @"Opportunity rarely knocks on your door. Knock rather on opportunity’s door if you ardently wish to enter. \nB. C. Forbes",
    @"A wise man will make more opportunities than he finds.",
    @"The price of success is perseverance. The price of failure comes cheaper.",
    @"Destiny is not a matter of chance; it is a matter of choice. It is not something to be waited for; but. rather something to be achieved. \nWilliam Jennings Bryan",
    @"In the middle of difficulty lies opportunity. \nAlbert Einstein",
    @"Opportunity... often it comes in the form of misfortune, or temporary defeat. \nNapoleon Hill",
    @"We don’t need more strength or more ability or greater opportunity. What we need is to use what we have. \nBasil S. Walsh",
    @"Each problem has hidden in it an opportunity so powerful that it literally dwarfs the problem. The greatest success stories were created by people who recognized a problem and turned it into an opportunity.",
    @"There is no future in any job. The future lies in the man who holds the job. \nGeorge Crane",
    @"Always think of your customers as ‘suppliers’ first. Work closely with them so they can ‘supply you’ with information you need to ‘supply them’ with the right products and services. \nSusie Marthaller",
    @"They’re only truly great who are truly good. \nGeorge Chapman",
    @"Work joyfully and peacefully, knowing that right thoughts and right efforts will inevitably bring about right results. \nJames Allen",
    @"If there’s a way to do it better... find it. \nThomas A. Edison",
    @"Always do your best. What you plant now, you will harvest later. \nOG Mandino",
    @"The glory that goes with wealth is fleeting and fragile; virtue is a possession glorious and eternal. \nSallust",
    @"A wise man will make more opportunities than he finds.",
    @"Give the world the best that you have, and the best will come back to you. \nMadeline Bridges",
    @"No legacy is so rich as honesty. \nWilliam Shakespeare",
    @"When you cease to dream you cease to live. \nMalcolm S. Forbes",
    @"Our aspirations are our possibilities. \nRobert Browning",
    @"The entrepreneur is essentially a visualizer and an actualizer. He can visualize something, and when he visualizes it he sees exactly how to make it happen\nRobert L. Schwartz",
    @"Image creates desire. You will what you imagine. \nJ. G. Galliore",
    @"To lead a symphony, you must occasionally turn your back to the crowd.",
    @"Love is everything. It is the key to life, and its influences are those that move the world. \nRalph Waldo Emerson",
    @"We are all born for love. It is the principle of existence, and its only end. \nBenjamin Disraeli",
    @"There is no right way to do something wrong.",
    @"Cherish your visions and your dreams as they are the children of your soul; the blueprints of your ultimate achievements. \nNapoleon Hill",
    @"The source and centre of all man’s creative power is his power of making images, or the power of imagination. \nRobert Collier",
    @"All men who have achieved great things have been dreamers. \nOrison Swett Marden",
    @"For imagination sets the goal “pictures” which our automatic mechanism works on. We act, or fail to act, not because of “will”, as is so commonly believed, but because of imagination. \nMaxwell Maltz",
    @"Every job is a self portrait of the person who did it. Autograph your work",
    @"with quality.",
    @"First comes thought, then organization of that thought into ideas and plans; then transformation of those plans into reality. The beginning, as you will observe, is in your imagination. \nNapoleon Hill",
    @"A man’s dreams are an index to his greatness.",
    @"Rather fail with honor than succeed by fraud. \nSophocles",
    @"The only limits are, as always, those of vision. \nJames Broughton",
    @"I am imagination. I can see what the eyes cannot see. I can hear what the ears cannot hear. I can feel what the heart cannot feel. \nPeter Nivio Zarlenga",
    @"Failure is the only opportunity to more intelligently begin again. \nHenry Ford",
    @"The more sand that has escaped from the hourglass of life, the clearer we should see through it. \nJean Paul",
    @"Waste of time is the most extravagant and costly of all expenses.",
    @"The empires of the future are empires of the mind. \nWinston Churchill",
    @"Life without love is like a tree without blossom and fruit. \nKahul Gibran",
    @"He has achieved success who has lived well, laughed often. and loved much.",
    @"Life is like riding a bicycle. You don’t fall off unless you stop pedaling.",
    @"The person who pays an ounce of principle for a pound of popularity gets badly cheated.",
    @"He who has health, has hope; and he who has hope, has everything. \nArabian Proverb",
    @"Let each day be your masterpiece.",
    @"Make the mistakes of yesterday your lessons for today.",
    @"I spoke with an elderly Japanese assembly worker who found our concept of ‘plus-or-minus’ bewildering. He humbly explained that his sole tolerance was ‘perfection’\nCarole O’Reilly",
    @"Once you have learned to love, you will have learned to live.",
    @"Few things are impossible to diligence and skill... great works are performed not by strength, but perseverance. \nSamuel Johnson",
    @"The day you take complete responsibility for yourself. the day you stop making excuses, that’s the day you start to the top. \nO. J. Simpson",
    @"Your only obligation in any lifetime is to be true to yourself. \nRichard Bach",
    @"The rewards for those who persevere far exceed the pain that must precede the victory. \nTed Engstrom",
    @"When you’re out of quality you’re out of business.",
    @"I was taught very early that I would have to depend entirely upon myself; that my future lay in my own hands. \nDarius Ogden Mills",
    @"Hold yourself responsible for a higher standard than everybody else expects of you. Never excuse yourself. \nHenry Ward beecher",
    @"Our greatest glory is not in never failing, but in rising every time we fall. \nConfucius",
    @"Success on any major scale requires you to accept responsibility... in the final analysis, the one quality that all successful people have... is the ability to take on responsibility. \nMichael Korda",
    @"Life will always be to a large extent what we ourselves make it. \nSamuel Smiles",
    @"In helping others, we shall help ourselves, for whatever good we give out completes the circle and comes back to us. \nHora Edwards",
    @"There is a kind of elevation which does not depend on fortune; it is a certain air which distinguishes us, and seems to destine us for great things; it is a price which we imperceptibly set upon ourselves. \nFrancois De La Rochefoucauld",
    @"Nothing happens by itself... it all will come your way, once you understand that you have to make it come your way, by your own exertions. \nBen Stein",
    @"Success seems to be largely a matter of hanging on after the others have let go. \nWilliam Feather",
    @"To endure is greater than to dare; to tire out hostile fortune; to be daunted by no difficulty; to keep heart when all have lost it - who can say this is not greatness. \nWilliam Makepeace Thackeray",
    @"Most people give up just when they’re about to achieve success. They quit on the one yard line. They give up at the last minute of the game one foot from the winning touchdown. \nH. Ross Perot",
    @"If you don’t know where you’re going, any road will get you there.",
    @"If you can force your heart and nerve and sinew to serve your turn long after they are gone, and so hold on when there is nothing in you except the will which says to them: “Hold on!”\nRudyard Kipling",
    @"Remember when life’s path is steep to keep your mind even.",
    @"History has demonstrated that the most notable winners usually encountered heartbreaking obstacles before they triumphed. They won because they refused to become discouraged by their defeats. \nB. C. Forbes",
    @"People rarely succeed at anything unless they have fun doing it.",
    @"Effort only fully releases its reward after a person refuses to quit. \nNapoleon Hill",
    @"About the only thing that comes without effort is old age.",
    @"Do not worry about whether or not the sun will rise. Be prepared to enjoy it.",
    @"Of all our human resources, the most precious is the desire to improve.",
    @"The customer is our final inspector.",
    @"Not in time, place or circumstance, but in the man lies success. \nCharles B. Rouss",
    @"Don’t compromise yourself. You are all you’ve got. \nBetty Ford",
    @"The moment you have in your heart this extraordinary thing called love and feel the depth, the delight, the ecstasy of it, you will discover that for you the world is transformed. \nJ. krishnamurti",
    @"It’s the constant and determined effort that breaks down all resistance, sweeps away all obstacles. \nClaude M. Bristol",
    @"A man carries his success or his failure with him.... it does not depend on outside conditions. \nRalph Waldo Trine",
    @"I am only one; but still I am one. I cannot do everything, but still I can do something; I will not refuse to do the something I can do. \nHelen Keller",
    @"There are always two choices, two paths to take. One is easy. And its only reward is that it’s easy.",
    @"Do all things with love. \nOg Mandino",
    @"All great achievements require time. \nDavid Joseph Schwartz",
    @"As human beings, we are endowed with freedom of choice, and we cannot shuffle off our responsibility upon the shoulders of God or nature. We must shoulder it ourselves. It is up to us. \nArnold J. Toynbee",
    @"Where there is love there is life... \nMohandas Gandhi",
    @"A ship in a harbour is safe, but that’s not what ships are built for.",
    @"Remember, no one can make you feel inferior without your consent. \nEleanor Roosevelt",
    @"When you cease to make a contribution you begin to die. \nEleanor Roosevelt",
    @"We make a living by what we get, but we make a life by what we give.",
    @"Aerodynamically the bumble bee shouldn’t be able to fly, but the bumble bee doesn’t know it so it goes on flying anyway. \nMary Kay Ash",
    @"The secret of life is to know who you are and where you are going.",
    @"The mind, like a parachute, functions only when open.",
    @"You will find as you look back upon your life that the moments when you have really lived, are the moments when you have done things in a spirit of love. \nHenry Drummond",
    @"Waste not fresh tears over old griefs.",
    @"To accomplish great things we must not only act, but also dream; not only plan, but also believe.",
    @"Treasure the love you receive above all. It will survive long after your good health has vanished. \nOg Mandino",
    @"Patience is bitter but its fruit is sweet.",
    @"Courage is the price that life exacts for granting peace. \nAmelia Earhart",
    @"If you really do put a small value upon yourself, rest assured that the world will not raise the price.",
    @"The smallest good deed is greater than the grandest intention.",
    @"We act as though comfort and luxury were the chief requirements of life when all we need to make us really happy is something to be enthusiastic about.",
    @"Those who bring sunshine to the lives of others cannot keep it from themselves. \n James Barrie",
    @"I cannot change yesterday. \nI can only make the most of today, and look with hope toward tomorrow.",
    @"While faith makes all things possible, it is love that makes all things easy.",
    @"Good intentions are no substitute for action; failure usually follows the path of least persistence.",
    @"Better keep yourself clean and bright; you are the window through which you must see the world. \nGeorge Bernard Shaw",
    @"Good, better, best; never let it rest till your good is better",
    @"and your better is best.",
    @"After the verb ‘to Love’, ‘to Help’ is the most beautiful verb in the world. \ Bertha Von Suttner",
    @"Trust in God. Believe in yourself. Dare to dream. \nRobert Schuller",
    @"Never let a difficulty stop you; it may be only sand on your track to prevent your skidding.",
    @"Purpose is what gives life a meaning.",
    @"Love is life... and if you miss love, you miss life. \nLeo Buscaglia",
    @"The journey of a thousand miles starts with a single step. \nChinese Proverb",
    @"Be wiser than other people if you can; but do not tell them so.",
    @"Co-operation is spelled with two letters. \nWE.",
    @"I don’t think much of a man who is not wiser today than he was yesterday. \n Abraham Lincoln",
    @"People can alter their lives by altering their attitudes. \nWilliam James",
    @"Of all the things you wear, your expression is the most important.",
    @"God grant me the serenity to accept the things .I cannot change, the courage to change the things I can, and the wisdom to know the difference. \nReinhold Niebuhr",
    @"Opportunities are disguised by hard work, so most people don’t recognise them. \nAnn Landers",
    @"The world is full of beauty when your heart is filled with love.",
    @"The only way of finding the limits of the possible is by going beyond them into the impossible. \nArthur C. Clarke",
    @"We are all inventors, each sailing out on a voyage of discovery, guided each by a private chart, of which there is no duplicate. The world is all gates, all opportunities. \nRalph Waldo Emerson",
    @"You cannot plough a field by turning it over in your mind.",
    @"When the best things are not possible, the best may be made of those that are. \nRichard Hooker",
    @"Great spirits have always encountered violent opposition from mediocre minds. \nAlbert Einstein",
    @"Knowing is not enough; we must apply.Willing is not enough; we must do. \nJohann Wolfgang von Goethe ",
    @"Nothing great was ever achieved without enthusiasm. \nRalph Waldo Emerson", nil];
    
    int stringPivot = 0;
    NSArray* monthDays = [[NSArray alloc] initWithObjects:@"31",@"29",@"31",@"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31",nil];
    
    for(int k = 0; k<[monthDays count];k++){
        
        NSString* temp = [monthDays objectAtIndex:k];
        
        for(int m=1;m<=[temp intValue];m++){
            
            NotificationQuotes* nq = [NSEntityDescription insertNewObjectForEntityForName:@"NotificationQuotes" inManagedObjectContext:self.managedObjectContext];
            
            nq.quoteString =[arr objectAtIndex:stringPivot++];
            nq.date = [NSString stringWithFormat:@"%2d-%2d",m,k+1];
            
        }
    }
    
    NSError* err = nil;
    if(![self.managedObjectContext save:&err]){
        
        NSLog(@"Error");
    }
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Demo" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Demo.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
