return {
    enabled = true,
    preset = {
        header = [[  
   ::::::::::::::::::::::::::::::::::::::::::::   
 :..............................................: 
 ................................................ 
 ......X:........................................ 
 ......X:........................................ 
 ....XXX......................................... 
 ....x.X:...............x+++++x.................. 
 ...Xx..X.............:++++++xxx................. 
 ....X.X:............X++++++X.................... 
 ...+++.++..........x++++++++x:.................. 
 ....X.X:....xX;;;;X++++++++++X;;;;Xx............ 
 ....X..X...X;;;;;;;++++++++++;;;;;;;X........... 
 ...;;;.;;.X;;+++;;++++++++++++;;+++;;X.......... 
 ....X..X..X;x...x+++++....+++++x...x;X.......... 
 ....X....:...X.X+++;;......;;+++X.X...:......... 
 ....X..X...x...X++;;.:;..;:.;;++X...x........... 
 ...XXXX:........x::............x................ 
 ....X..X.......X::+++......+++..X.......:x.X.... 
 ....X.x:........x:.++++++++++..x........X..X.... 
 .................X:.++++++++..X.........:XXXX... 
 ..............xxxx+:.........+xx;x......X..X.... 
 ...........Xxxxx;;;.;::::::;;..;;xx;X......X.... 
 .........:xx;;;;:;;xx+;;;.;xx;;;;:;;xx:.X..X.... 
 .........xxxx+;:;xxx;+xxx+;;+xx;;;+xx+x.;.;;;... 
 .........xxxxxx;xxxxxxxxxxxx;xxx;xxxxx:.X..X.... 
 .........x++...Xxxxxxx....xxxxxxX...XX:.:X.X.... 
 .........:++...Xxxxxx;....;xxxxxX...++.++.+++... 
 ...............XXxx..........Xx+X.......:X.X.... 
 ................XX............xx........X..xX... 
 ........................................:X.x.... 
 .........................................XXX.... 
 ........................................:X...... 
 ........................................:X...... 
 ................................................ 
 :..............................................: 
   ::::::::::::::::::::::::::::::::::::::::::::   
   ]]
    },
    formats = {
        header = { "%s", align = "center" },
    },
    sections = {
        {
            pane = 1,
            section = "header"
        },
        {
            pane = 2,
            padding = 7
        },
        {
            pane = 2,
            padding = 1,
            desc = "Find Git Files",
            action = ":Telescope git_files",
            key = "g",
            icon = "🔭"
        },
        {
            pane = 2,
            padding = 1,
            desc = "Find Files",
            action = ":Telescope find_files",
            key = "f",
            icon = "🔎"
        },
        {
            pane = 2,
            padding = 1,
            desc = "File Explorer",
            action = ":Ex",
            key = "e",
            icon = "🗂️"
        },
        {
            pane = 2,
            desc = "Quit",
            action = ":q",
            key = "q",
            icon = "↖️",
            padding = 2
        },
        {
            pane = 2,
            title = "Recent Files",
            section = "recent_files",
            icon = "🗂️",
            padding = 3
        },
        function ()
            local win = {
                'You Aced it!',
                'You dealt with that pretty well!',
                'Looks like you weren\'t bluffing!',
                'Too bad these chips are all virtual...',
                'How the turn tables.',
                'Looks like I\'ve taught you well',
                'You made som heads up plays!',
                'Good thing I didnt\'t bet against you!',
            }
            local lose = {
                'Maybe Go Fish in more our speed...',
                'We folded like a cheap suit!',
                'Time for us to shuffle off and try again!',
                'You know what they say, the house alwasy wins!',
                'Looks like we found out who the real Joker is!',
                'On no, were you bluffing too?',
                'Looks like the joke\'s on us!',
                'If I had hands I would have covered my eyes!',
                'I\'m literally a fool, what\'s your excuse?',
                'What a flop!',
            }

            local quip
            local didWin = true
            local coinflip = math.random()
            if coinflip < .5 then
                didWin = false
            end

            if didWin then
                local wi = math.random(1, #win)
                quip = win[wi]
                vim.api.nvim_set_hl(0, 'SnacksDashboardHeader', { fg = 'Green', bold = true } )
            else
                local li = math.random(1, #lose)
                quip = lose[li]
                vim.api.nvim_set_hl(0, 'SnacksDashboardHeader', { fg = 'Red', bold = true } )
            end

            return {
                pane = 2,
                desc = quip,
                padding = 3,
                align = "center"
            }
        end
    }
}
