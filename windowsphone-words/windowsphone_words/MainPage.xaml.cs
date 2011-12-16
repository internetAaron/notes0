using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using Microsoft.Phone.Controls;

namespace PhoneApp1
{
    public partial class Pole : PhoneApplicationPage
    {
        public int scores = 0;
        public int nextScore = 200;

        List<KeyValuePair<string, string>> myWords = new List<KeyValuePair<string, string>>()
        {
          new KeyValuePair<string,string>("abbey", "The group of buildings which collectively form the dwelling-place of a society of monks or nuns.")
            ,new KeyValuePair<string,string>("abbot", "The superior of a community of monks. ")
            ,new KeyValuePair<string,string>("abyss", "Bottomless gulf. ")
            ,new KeyValuePair<string,string>("album", "A book whose leaves are so made to form paper frames for holding photographs or the like. ")
            ,new KeyValuePair<string,string>("alder", "Any shrub or small tree of the genus Alumnus, of the oak family. ")
            ,new KeyValuePair<string,string>("alias", "An assumed name. ")
            ,new KeyValuePair<string,string>("alien", "One who owes allegiance to a foreign government. ")
            ,new KeyValuePair<string,string>("alley", "A narrow street, garden path, walk, or the like. ")
            ,new KeyValuePair<string,string>("altar", "Any raised place or structure on which sacrifices may be offered or incense burned. ")
            ,new KeyValuePair<string,string>("amity", "Friendship. ")
            ,new KeyValuePair<string,string>("amour", "A love-affair, especially one of an illicit nature. ")
            ,new KeyValuePair<string,string>("anode", "The point where or path by which a voltaic current enters an electrolyte or the like. ")
            ,new KeyValuePair<string,string>("antic", "A grotesque, ludicrous, or fantastic action. ")
            ,new KeyValuePair<string,string>("arbor", "A tree. ")
            ,new KeyValuePair<string,string>("ardor", "Intensity of passion or affection. ")
            ,new KeyValuePair<string,string>("aroma", "An agreeable odor. ")
            ,new KeyValuePair<string,string>("assay", "The chemical analysis or testing of an alloy ore. ")
            ,new KeyValuePair<string,string>("azure", "The color of the sky. ")
            ,new KeyValuePair<string,string>("baize", "A single-colored napped woolen fabric used for table-covers, curtains, etc. ")
            ,new KeyValuePair<string,string>("baton", "An official staff borne either as a weapon or as an emblem of authority or privilege. ")
            ,new KeyValuePair<string,string>("belle", "A woman who is a center of attraction because of her beauty, accomplishments, etc. ")
            ,new KeyValuePair<string,string>("berth", "A bunk or bed in a vessel, sleeping-car, etc. ")
            ,new KeyValuePair<string,string>("bevel", "Any inclination of two surfaces other than 90 degrees. ")
            ,new KeyValuePair<string,string>("bight", "A slightly receding bay between headlands, formed by a long curve of a coast-line. ")
            ,new KeyValuePair<string,string>("biped", "An animal having two feet. ")
            ,new KeyValuePair<string,string>("blaze", "A vivid glowing flame. ")
            ,new KeyValuePair<string,string>("bosom", "The breast or the upper front of the thorax of a human being, especially of a woman. ")
            ,new KeyValuePair<string,string>("brine", "Water saturated with salt. ")
            ,new KeyValuePair<string,string>("butte", "A conspicuous hill, low mountain, or natural turret, generally isolated. ")
            ,new KeyValuePair<string,string>("cabal", "A number of persons secretly united for effecting by intrigue some private purpose. ")
            ,new KeyValuePair<string,string>("cameo", "Any small engraved or carved work in relief. ")
            ,new KeyValuePair<string,string>("canon", "Any rule or law. ")
            ,new KeyValuePair<string,string>("canto", "One of the divisions of an extended poem. ")
            ,new KeyValuePair<string,string>("caret", "A sign (^) placed below a line, indicating where omitted words, etc., should be inserted. ")
            ,new KeyValuePair<string,string>("caste", "The division of society on artificial grounds. ")
            ,new KeyValuePair<string,string>("chaos", "Any condition of which the elements or parts are in utter disorder and confusion. ")
            ,new KeyValuePair<string,string>("chasm", "A yawning hollow, as in the earth's surface. ")
            ,new KeyValuePair<string,string>("corps", "A number or body of persons in some way associated or acting together. ")
            ,new KeyValuePair<string,string>("covey", "A flock of quails or partridges. ")
            ,new KeyValuePair<string,string>("creak", "A sharp, harsh, squeaking sound. ")
            ,new KeyValuePair<string,string>("creed", "A formal summary of fundamental points of religious belief. ")
            ,new KeyValuePair<string,string>("curio", "A piece of bric-a-brac. ")
            ,new KeyValuePair<string,string>("datum", "A premise, starting-point, or given fact. ")
            ,new KeyValuePair<string,string>("debut", "A first appearance in society or on the stage. ")
            ,new KeyValuePair<string,string>("decoy", "Anything that allures, or is intended to allures into danger or temptation. ")
            ,new KeyValuePair<string,string>("deist", "One who believes in God, but denies supernatural revelation. ")
            ,new KeyValuePair<string,string>("deity", "A god, goddess, or divine person. ")
            ,new KeyValuePair<string,string>("depth", "Deepness. ")
            ,new KeyValuePair<string,string>("dogma", "A statement of religious faith or duty formulated by a body claiming authority. ")
            ,new KeyValuePair<string,string>("dolor", "Lamentation. ")
            ,new KeyValuePair<string,string>("donee", "A person to whom a donation is made. ")
            ,new KeyValuePair<string,string>("donor", "One who makes a donation or present. ")
            ,new KeyValuePair<string,string>("dowry", "The property which a wife brings to her husband in marriage. ")
            ,new KeyValuePair<string,string>("edict", "That which is uttered or proclaimed by authority as a rule of action. ")
            ,new KeyValuePair<string,string>("elegy", "A lyric poem lamenting the dead. ")
            ,new KeyValuePair<string,string>("epoch", "A interval of time, memorable for extraordinary events. ")
            ,new KeyValuePair<string,string>("epode", "A species of lyric poems. ")
            ,new KeyValuePair<string,string>("facet", "One of the small triangular plane surfaces of a diamond or other gem. ")
            ,new KeyValuePair<string,string>("feint", "Any sham, pretense, or deceptive movement. ")
            ,new KeyValuePair<string,string>("felon", "A criminal or depraved person. ")
            ,new KeyValuePair<string,string>("fetus", "The young in the womb or in the egg. ")
            ,new KeyValuePair<string,string>("flora", "The aggregate of plants growing without cultivation in a district. ")
            ,new KeyValuePair<string,string>("folio", "A sheet of paper folded once, or of a size adapted to folding once. ")
            ,new KeyValuePair<string,string>("forte", "A strong point. ")
            ,new KeyValuePair<string,string>("gauge", "An instrument for measuring. ")
            ,new KeyValuePair<string,string>("gamut", "The whole range or sequence. ")
            ,new KeyValuePair<string,string>("giver", "One who gives, in any sense. ")
            ,new KeyValuePair<string,string>("gourd", "A melon, pumpkin, squash, or some similar fruit having a hard rind. ")
            ,new KeyValuePair<string,string>("grief", "Sorrow. ")
            ,new KeyValuePair<string,string>("guess", "Surmise. ")
            ,new KeyValuePair<string,string>("guile", "Duplicity. ")
            ,new KeyValuePair<string,string>("guise", "The external appearance as produced by garb or costume. ")
            ,new KeyValuePair<string,string>("gusto", "Keen enjoyment. ")
            ,new KeyValuePair<string,string>("havoc", "Devastation. ")
            ,new KeyValuePair<string,string>("horde", "A gathered multitude of human beings. ")
            ,new KeyValuePair<string,string>("hydra", "The seven- or nine-headed water-serpent slain by Hercules. ")
            ,new KeyValuePair<string,string>("idiom", "A use of words peculiar to a particular language. ")
            ,new KeyValuePair<string,string>("Iliad", "A Greek epic poem describing scenes from the siege of Troy. ")
            ,new KeyValuePair<string,string>("inlet", "A small body of water leading into a larger. ")
            ,new KeyValuePair<string,string>("irony", "Censure or ridicule under cover of praise or compliment. ")
            ,new KeyValuePair<string,string>("islet", "A little island. ")
            ,new KeyValuePair<string,string>("Jingo", "One of a party in Great Britain in favor of spirited and demonstrative foreign policy. ")
            ,new KeyValuePair<string,string>("junta", "A council or assembly that deliberates in secret upon the affairs of government. ")
            ,new KeyValuePair<string,string>("juror", "One who serves on a jury or is sworn in for jury duty in a court of justice. ")
            ,new KeyValuePair<string,string>("ladle", "A cup-shaped vessel with a long handle, intended for dipping up and pouring liquids. ")
            ,new KeyValuePair<string,string>("lapse", "A slight deviation from what is right, proper, or just. ")
            ,new KeyValuePair<string,string>("levee", "An embankment beside a river or stream or an arm of the sea, to prevent overflow. ")
            ,new KeyValuePair<string,string>("lever", "That which exerts, or through which one may exert great power. ")
            ,new KeyValuePair<string,string>("libel", "Defamation. ")
            ,new KeyValuePair<string,string>("liner", "A vessel belonging to a steamship-line. ")
            ,new KeyValuePair<string,string>("lingo", "Language. ")
            ,new KeyValuePair<string,string>("logic", "The science of correct thinking. ")
            ,new KeyValuePair<string,string>("lough", "A lake or loch. ")
            ,new KeyValuePair<string,string>("louse", "A small insect parasitic on and sucking the blood of mammals. ")
            ,new KeyValuePair<string,string>("lying", "Untruthfulness. ")
            ,new KeyValuePair<string,string>("maize", "Indian corn: usually in the United States called simply corn. ")
            ,new KeyValuePair<string,string>("mania", "Insanity. ")
            ,new KeyValuePair<string,string>("manor", "The landed estate of a lord or nobleman. ")
            ,new KeyValuePair<string,string>("maxim", "A principle accepted as true and acted on as a rule or guide. ")
            ,new KeyValuePair<string,string>("metal", "An element that forms a base by combining with oxygen, is usually hard, heavy, and lustrous. ")
            ,new KeyValuePair<string,string>("miser", "A person given to saving and hoarding unduly. ")
            ,new KeyValuePair<string,string>("miter", "The junction of two bodies at an equally divided angle. ")
            ,new KeyValuePair<string,string>("motto", "An expressive word or pithy sentence enunciating some guiding rule of life, or faith. ")
            ,new KeyValuePair<string,string>("navel", "The depression on the abdomen where the umbilical cord of the fetus was attached. ")
            ,new KeyValuePair<string,string>("oakum", "Hemp-fiber obtained by untwisting and picking out loosely the yarns of old hemp rope. ")
            ,new KeyValuePair<string,string>("odium", "A feeling of extreme repugnance, or of dislike and disgust. ")
            ,new KeyValuePair<string,string>("onset", "An assault, especially of troops, upon an enemy or fortification. ")
            ,new KeyValuePair<string,string>("optic", "Pertaining to the eye or vision. ")
            ,new KeyValuePair<string,string>("pagan", "A worshiper of false gods. ")
            ,new KeyValuePair<string,string>("palsy", "Paralysis. ")
            ,new KeyValuePair<string,string>("panel", "A rectangular piece set in or as in a frame. ")
            ,new KeyValuePair<string,string>("panic", "A sudden, unreasonable, overpowering fear. ")
            ,new KeyValuePair<string,string>("payee", "A person to whom money has been or is to be paid. ")
            ,new KeyValuePair<string,string>("pedal", "A lever for the foot usually applied only to musical instruments, cycles, and other machines. ")
            ,new KeyValuePair<string,string>("piece", "A loose or separated part, as distinguished from the whole or the mass. ")
            ,new KeyValuePair<string,string>("plumb", "A weight suspended by a line to test the verticality of something. ")
            ,new KeyValuePair<string,string>("poesy", "Poetry. ")
            ,new KeyValuePair<string,string>("poise", "Equilibrium. ")
            ,new KeyValuePair<string,string>("posse", "A force of men. ")
            ,new KeyValuePair<string,string>("proxy", "A person who is empowered by another to represent him or her in a given matter. ")
            ,new KeyValuePair<string,string>("qualm", "A fit of nausea. ")
            ,new KeyValuePair<string,string>("queue", "A file of persons waiting in order of their arrival, as for admittance. ")
            ,new KeyValuePair<string,string>("radix", "That from or on which something is developed. ")
            ,new KeyValuePair<string,string>("rigor", "Inflexibility. ")
            ,new KeyValuePair<string,string>("rondo", "A musical composition during which the first part or subject is repeated several times. ")
            ,new KeyValuePair<string,string>("salvo", "A salute given by firing all the guns, as at the funeral of an officer. ")
            ,new KeyValuePair<string,string>("satyr", "A very lascivious person. ")
            ,new KeyValuePair<string,string>("scope", "A range of action or view. ")
            ,new KeyValuePair<string,string>("sense", "The signification conveyed by some word, phrase, or action. ")
            ,new KeyValuePair<string,string>("siege", "A beleaguerment. ")
            ,new KeyValuePair<string,string>("sinus", "An opening or cavity. ")
            ,new KeyValuePair<string,string>("siren", "A sea-nymph, described by Homer as dwelling between the island of Circe and Scylla. ")
            ,new KeyValuePair<string,string>("skiff", "Usually, a small light boat propelled by oars. ")
            ,new KeyValuePair<string,string>("sylph", "A slender, graceful young woman or girl. ")
            ,new KeyValuePair<string,string>("synod", "An ecclesiastical council. ")
            ,new KeyValuePair<string,string>("tenet", "Any opinion, principle, dogma, or doctrine that a person believes or maintains as true. ")
            ,new KeyValuePair<string,string>("tenor", "A settled course or manner of progress. ")
            ,new KeyValuePair<string,string>("tilth", "Cultivation. ")
            ,new KeyValuePair<string,string>("tinge", "A faint trace of color. ")
            ,new KeyValuePair<string,string>("trait", "A distinguishing feature or quality. ")
            ,new KeyValuePair<string,string>("triad", "A group of three persons of things. ")
            ,new KeyValuePair<string,string>("usage", "Treatment. ")
            ,new KeyValuePair<string,string>("usury", "The demanding for the use of money as a loan, a rate of interest beyond what is allowed by law. ")
            ,new KeyValuePair<string,string>("venom", "The poisonous fluid that certain animals secrete. ")
            ,new KeyValuePair<string,string>("viola", "A musical instrument somewhat larger than a violin. ")
            ,new KeyValuePair<string,string>("virtu", "Rare, curious, or beautiful quality. ")
            ,new KeyValuePair<string,string>("vista", "A view or prospect. ")
            ,new KeyValuePair<string,string>("vogue", "The prevalent way or fashion. ")
        };

        Random r = new Random(DateTime.Now.Millisecond);
        public int random()
        {
            return r.Next(0, 140);
        }

        // Constructor
        public Pole()
        {
            InitializeComponent();

            new_game();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

            if (!String.IsNullOrEmpty(Guess.Text) && Word.Text.IndexOf(Guess.Text) >= 0)
            {
                this.scores += nextScore;

                Message.Text = "There is such a letter!";
                Message.Foreground = new SolidColorBrush(Colors.Green);

                if (t0.Text.Equals(Guess.Text)) t0.Visibility = System.Windows.Visibility.Visible;
                if (t1.Text.Equals(Guess.Text)) t1.Visibility = System.Windows.Visibility.Visible;
                if (t2.Text.Equals(Guess.Text)) t2.Visibility = System.Windows.Visibility.Visible;
                if (t3.Text.Equals(Guess.Text)) t3.Visibility = System.Windows.Visibility.Visible;
                if (t4.Text.Equals(Guess.Text)) t4.Visibility = System.Windows.Visibility.Visible;

                if (
                    t0.Visibility == System.Windows.Visibility.Visible &&
                    t1.Visibility == System.Windows.Visibility.Visible &&
                    t2.Visibility == System.Windows.Visibility.Visible &&
                    t3.Visibility == System.Windows.Visibility.Visible &&
                    t4.Visibility == System.Windows.Visibility.Visible
                 )
                {
                    Message.Text = "OMG! You solved it!";
                    Message.Foreground = new SolidColorBrush(Colors.White);
                    MessageStack.Background = new SolidColorBrush(Colors.Green);
                }


            }
            else
            {
                this.nextScore -= 10;
                Message.Foreground = new SolidColorBrush(Colors.Red);
                Message.Text = "No such letter in the word";
            }



            txtscore.Text = "Score : " + scores.ToString();
            Guess.Text = String.Empty;
            Message.Visibility = System.Windows.Visibility.Visible;

        }

        private void newgame_Click(object sender, RoutedEventArgs e)
        {
            new_game();
        }

        public void new_game()
        {
            int index = random();

            Word.Text = this.myWords[index].Key;
            Description.Text = this.myWords[index].Value;

            t0.Text = Word.Text[0].ToString();
            t1.Text = Word.Text[1].ToString();
            t2.Text = Word.Text[2].ToString();
            t3.Text = Word.Text[3].ToString();
            t4.Text = Word.Text[4].ToString();

            t0.Visibility = System.Windows.Visibility.Collapsed;
            t1.Visibility = System.Windows.Visibility.Collapsed;
            t2.Visibility = System.Windows.Visibility.Collapsed;
            t3.Visibility = System.Windows.Visibility.Collapsed;
            t4.Visibility = System.Windows.Visibility.Collapsed;

            Message.Visibility = System.Windows.Visibility.Collapsed;
            MessageStack.Background = new SolidColorBrush(Colors.Transparent);
        }
    }
}