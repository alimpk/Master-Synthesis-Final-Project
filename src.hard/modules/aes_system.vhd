
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity aes_system is
    port ( --system signals
           reset              : in  std_logic;
           clock              : in  std_logic;
           --key input related signals
           key                : in  std_logic_vector (31 downto 0);
           keynew             : in  std_logic;
           keyload            : in  std_logic;
			  core_select		: in std_logic_vector (2 downto 0);

           keyexpansionready  : out std_logic;
           --text input related signals
           text               : in  std_logic_vector (127 downto 0);
           empty              : out std_logic;
           enable             : in  std_logic;
           --text output related signals
           ciphertext         : out std_logic_vector (127 downto 0);
           ready              : out std_logic);
end aes_system;

architecture Behavioral of aes_system is

	component aes is
		 port ( --system signals
				  reset              : in  std_logic;
				  clock              : in  std_logic;
				  --key input related signals
				  key                : in  std_logic_vector (31 downto 0);
				  keynew             : in  std_logic;
				  keyload            : in  std_logic;
				  keyexpansionready  : out std_logic;
				  --text input related signals
				  text               : in  std_logic_vector (127 downto 0);
				  empty              : out std_logic;
				  enable             : in  std_logic;
				  --text output related signals
				  ciphertext         : out std_logic_vector (127 downto 0);
				  ready              : out std_logic);
	end component;
	
	signal 
		keyexpansionready0,
		keyexpansionready1,	
		keyexpansionready2,	
		keyexpansionready3,	
		keyexpansionready4,	
		keyexpansionready5,	
		keyexpansionready6,	
		keyexpansionready7,	
		empty0,empty1,
		empty2,empty3,
		empty4,empty5,
		empty6,empty7,
		ready0,ready1,
		ready2,ready3,
		ready4,ready5,
		ready6,ready7 : std_logic;
	signal 
		ciphertext0,
		ciphertext1,
		ciphertext2,
		ciphertext3,
		ciphertext4,
		ciphertext5,
		ciphertext6,
		ciphertext7 :  std_logic_vector (127 downto 0);

	
begin
	
	with core_select select 
		ready <= ready0 when "000",
					ready1 when "001",
					ready2 when "010",
					ready3 when "011",
					ready4 when "100",
					ready5 when "101",
					ready6 when "110",
					ready7 when "111";
					
					
					
					
	with core_select select 
		empty <= empty0 when "000",
					empty1 when "001",
					empty2 when "010",
					empty3 when "011",
					empty4 when "100",
					empty5 when "101",
					empty6 when "110",
					empty7 when "111";
		
	with core_select select 
		keyexpansionready <= 
					keyexpansionready0 when "000",
					keyexpansionready1 when "001",
					keyexpansionready2 when "010",
					keyexpansionready3 when "011",
					keyexpansionready4 when "100",
					keyexpansionready5 when "101",
					keyexpansionready6 when "110",
					keyexpansionready7 when "111";
					
	with core_select select
		ciphertext <= 
					ciphertext0 when "000",
					ciphertext1 when "001",
					ciphertext2 when "010",
					ciphertext3 when "011",
					ciphertext4 when "100",
					ciphertext5 when "101",
					ciphertext6 when "110",
					ciphertext7 when "111";
	aes0 : aes
		port map(
			reset => reset,
			clock => clock,
			enable => enable,
			key => key,
			keynew => keynew,
			keyload => keyload,
			keyexpansionready => keyexpansionready0,
			text => text,
			empty => empty0,
			ciphertext => ciphertext0,
			ready => ready0);
			
	aes1 : aes
		port map(
			reset => reset,
			clock => clock,
			enable => enable,
			key => key,
			keynew => keynew,
			keyload => keyload,
			keyexpansionready => keyexpansionready1,
			text => text,
			empty => empty1,
			ciphertext => ciphertext1,
			ready => ready1);
			
	aes2 : aes
		port map(
			reset => reset,
			clock => clock,
			key => key,
			enable => enable,
			keynew => keynew,
			keyload => keyload,
			keyexpansionready => keyexpansionready2,
			text => text,
			empty => empty2,
			ciphertext => ciphertext2,
			ready => ready2);
			
	aes3 : aes
		port map(
			reset => reset,
			clock => clock,
			key => key,
			enable => enable,
			keynew => keynew,
			keyload => keyload,
			keyexpansionready => keyexpansionready3,
			text => text,
			empty => empty3,
			ciphertext => ciphertext3,
			ready => ready3);

	aes4 : aes
		port map(
			reset => reset,
			clock => clock,
			key => key,
			enable => enable,
			keynew => keynew,
			keyload => keyload,
			keyexpansionready => keyexpansionready4,
			text => text,
			empty => empty4,
			ciphertext => ciphertext4,
			ready => ready4);
	aes5 : aes
		port map(
			reset => reset,
			clock => clock,
			key => key,
			enable => enable,
			keynew => keynew,
			keyload => keyload,
			keyexpansionready => keyexpansionready5,
			text => text,
			empty => empty5,
			ciphertext => ciphertext5,
			ready => ready5);
			
	aes6 : aes
		port map(
			reset => reset,
			clock => clock,
			key => key,
			enable => enable,
			keynew => keynew,
			keyload => keyload,
			keyexpansionready => keyexpansionready6,
			text => text,
			empty => empty6,
			ciphertext => ciphertext6,
			ready => ready6);
	aes7 : aes
		port map(
			reset => reset,
			clock => clock,
			key => key,
			enable => enable,
			keynew => keynew,
			keyload => keyload,
			keyexpansionready => keyexpansionready7,
			text => text,
			empty => empty7,
			ciphertext => ciphertext7,
			ready => ready7);
end Behavioral;

