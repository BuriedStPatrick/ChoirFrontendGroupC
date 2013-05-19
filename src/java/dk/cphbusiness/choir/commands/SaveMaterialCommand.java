package dk.cphbusiness.choir.commands;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.MaterialDetail;
import dk.cphbusiness.choir.contract.dto.MemberAuthentication;
import dk.cphbusiness.choir.contract.dto.MusicDetail;
import dk.cphbusiness.choir.contract.dto.MusicSummary;
import dk.cphbusiness.choir.contract.dto.VoiceSummary;
import dk.cphbusiness.choir.contract.eto.AuthenticationException;
import dk.cphbusiness.choir.contract.eto.NoSuchMaterialException;
import dk.cphbusiness.choir.contract.eto.NoSuchMusicException;
import dk.cphbusiness.choir.view.ChoirFactory;
import java.util.ArrayList;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Patrick
 */
public class SaveMaterialCommand extends TargetCommand {

    public SaveMaterialCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
    if(request.getParameter("id") != null){
        long id = Long.parseLong(request.getParameter("id"));
        String title = request.getParameter("title");
        String fileName = request.getParameter("fileName");
        int fileSize = Integer.parseInt(request.getParameter("fileSize"));
        int pageCount = 0;
        int playingTime = 0;
        if("sheet".equals(request.getParameter("type")) || "sheet".equals(request.getParameter("newType"))){
            pageCount = Integer.parseInt(request.getParameter("pageCount"));
        }else{
            playingTime = Integer.parseInt(request.getParameter("playingTime"));
        }
        long musicId = Long.parseLong(request.getParameter("musicId"));
        MusicDetail musicD = null;
        try {
            musicD = manager.findMusic(musicId);
        } catch (NoSuchMusicException ex) {
            Logger.getLogger(SaveMaterialCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        MusicSummary music = new MusicSummary(musicId, musicD.getTitle(), musicD.getComposer().getName(), musicD.getOpus(), "");
        ArrayList<VoiceSummary> voices = new ArrayList<VoiceSummary>(manager.listVoices());
        Collection<VoiceSummary> materialVoices = new ArrayList<VoiceSummary>();
        int size = voices.size();
        if (request.getParameter("voiceCodes") != null) {
            for (String voiceCode : request.getParameterValues("voiceCodes")) {
                for (int i = 0; i < size; i++) {
                    if (voices.get(i).getCode() == Integer.parseInt(voiceCode)) {
                        materialVoices.add(voices.get(i));
                    }
                }
            }
        }
        MaterialDetail material = new MaterialDetail(id, title, materialVoices, music, fileName, fileSize, playingTime, pageCount);
        try {
            System.out.println(id);
            System.out.println(title);
            System.out.println(musicId);
            for(VoiceSummary voice : materialVoices){
                System.out.println(voice.getName());
            }
            System.out.println(fileName);
            System.out.println(fileSize);
            System.out.println(playingTime);
            System.out.println(pageCount);
            manager.saveMaterial((MemberAuthentication) request.getSession().getAttribute("loggedIn"), material);

        } catch (NoSuchMaterialException ex) {
            throw new CommandException("Saving failed", ex.getMessage(), ex);
        } catch (AuthenticationException ex) {
            Logger.getLogger(SaveMaterialCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        request.setAttribute("materials", manager.listMaterials());
        request.setAttribute("music", manager.listMusic());
        request.setAttribute("voices", manager.listVoices());
        return super.execute(request);
    }
}
