import UIKit
import AVFoundation

protocol AudioRecordDelegate: AnyObject {
    
    func didFinishRecording(_ manager: AudioRecorderManager, success: Bool)
    
    func diddFinishPlaying(_ manager: AudioRecorderManager, success: Bool)
    
}

// Audio Manager
class AudioRecorderManager: NSObject {
    
    var audioRecorder: AVAudioRecorder?
    
    var audioPlayer: AVAudioPlayer?
    
    var audioFileURL: URL?
    
    weak var delegate: AudioRecordDelegate?
    
    override init() {
        super.init()
        setAudioSession()
    }
    
    // Session
    private func setAudioSession() {
        PessionUtil.openRecordServiceWithBlock(true) { [self] isOpen in
            if isOpen {
                let audioSession = AVAudioSession.sharedInstance()
                do {
                    try audioSession.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker)
                    try audioSession.setActive(true)
                    
                    audioFileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("recording.m4a")
                } catch {
                    print("音频设置会话失败:\(error.localizedDescription)")
                }
            } else {
                print("用户未打开权限")
            }
        }
    }
    
    // Start Record
    func startRecording() {
        guard let audioFileURL = self.audioFileURL else { return }
        
        // Config
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC), // m4a
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue // high quality
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFileURL, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.record()
        } catch {
            print("录音初始化失败:\(error.localizedDescription)")
        }
    }
    
    // Stop Record
    func stopRecord() {
        audioRecorder?.stop()
        audioRecorder = nil
    }
    
    // Play Audio
    func playAudio() {
        guard let audioFileURL = self.audioFileURL else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
            audioPlayer?.delegate = self
            if audioPlayer!.isPlaying {
                audioPlayer?.pause()
            } else {
                audioPlayer?.play()
            }
        } catch {
            print("播放音频失败:\(error.localizedDescription)")
        }
    }
    
    // Remove Record File
    func removeFile() {
        guard let audioFileURL = self.audioFileURL else { return }
        
        do {
            try FileManager.default.removeItem(at: audioFileURL)
        } catch {
            print("删除文件失败:\(error.localizedDescription)")
        }
    }

    // Avalible Audio Duration
    func getAudioDuration(url: URL) async -> Double? {
        let asset = AVAsset(url: url)
        
        do {
            // Use load(.duration) Asyn
            let duration: CMTime = try await asset.load(.duration)
            
            // Return Duration
            let seconds = CMTimeGetSeconds(duration)
            return seconds.isFinite ? seconds : nil
        } catch {
            // Return nil when error
            return nil
        }
    }
}

extension AudioRecorderManager: AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        delegate?.didFinishRecording(self, success: flag)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        delegate?.diddFinishPlaying(self, success: flag)
    }
    
}
