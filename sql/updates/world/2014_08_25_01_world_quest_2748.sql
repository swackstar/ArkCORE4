

-- http://db.vanillagaming.org/?quest=2748 	A Fine Egg
-- http://db.vanillagaming.org/?npc=7763	Curgle Cranklehop
-- http://db.vanillagaming.org/?item=8644 	A Fine Egg

set @QUEST = 2748;
set @QS = 7763;
set @QE = 7763;

delete from creature_queststarter where id=@QS and quest=@QUEST;
insert into creature_queststarter value (@QS,@QUEST);

delete from creature_questender where id=@QE and quest=@QUEST;
insert into creature_questender value (@QE,@QUEST);

UPDATE quest_template SET Method=2,PrevQuestId=2741,Flags=8200 WHERE Id=@QUEST;



